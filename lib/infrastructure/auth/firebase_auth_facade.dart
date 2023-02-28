import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:nota/domain/auth/auth_failure.dart';
import 'package:nota/domain/auth/i_auth_facade.dart';
import 'package:nota/domain/auth/user.dart';
import 'package:nota/domain/auth/value_objects.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._firestore,
  );

  final fb_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  @visibleForTesting
  bool isWeb = kIsWeb;

  CollectionReference<Map<String, dynamic>> get userCollection =>
      _firestore.collection('users');

  @override
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      return user;
    });
  }

  @override
  User get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser == null ? User.empty : firebaseUser.toUser;
  }

  @override
  Future<Either<AuthFailure, User>> userReload() async {
    try {
      var user = _firebaseAuth.currentUser;
      await user?.reload();
      user = _firebaseAuth.currentUser;
      return right(user == null ? User.empty : user.toUser);
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required FullName fullName,
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    try {
      // Get string values from value objects
      final emailAddressStr = emailAddress.getOrCrash();
      final passwordStr = password.getOrCrash();
      final fullNameStr = fullName.getOrCrash();
      // Create user with email and password
      final userCred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      final user = userCred.user?.toUser;
      // Create user document in Firestore
      if (user != null) {
        await userCollection
            .doc(user.id)
            .set(user.copyWith(name: fullNameStr).toDocument());
      }

      // Send email verification
      await userCred.user?.sendEmailVerification();

      return right(unit);
    } on fb_auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      }
      return left(const AuthFailure.serverError());
    } catch (e) {
      log('Register With Email And Password Error', error: e);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    try {
      // Get string values from value objects
      final emailAddressStr = emailAddress.getOrCrash();
      final passwordStr = password.getOrCrash();
      // Sign in with email and password
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      return right(unit);
    } on fb_auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      }
      return left(const AuthFailure.serverError());
    } catch (e) {
      log('Sign In With Email And Password Error', error: e);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      late fb_auth.UserCredential userCred;
      if (isWeb) {
        // Handle web google authentication
        final googleProvider = fb_auth.GoogleAuthProvider();
        userCred = await _firebaseAuth.signInWithPopup(googleProvider);
      } else {
        // Trigger the authentication flow
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          return left(const AuthFailure.cancelledByUser());
        }
        // Obtain the auth details from the request
        final googleAuth = await googleUser.authentication;
        // Create a new credential
        final credential = fb_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        // Once signed in, return the UserCredential
        userCred = await _firebaseAuth.signInWithCredential(credential);
      }

      final user = userCred.user?.toUser;

      // Create user document in Firestore if it doesn't exist
      if (user != null) {
        final userDoc = await userCollection.doc(user.id).get();

        if (!userDoc.exists) {
          await userCollection.doc(user.id).set(user.toDocument());
        }
      }
      return right(unit);
    } on fb_auth.FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return left(const AuthFailure.emailAlreadyInUse());
      }
      return left(const AuthFailure.serverError());
    } catch (e) {
      log('Sign In With Google Error', error: e);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
      return right(unit);
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
      return right(unit);
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }
}

extension on fb_auth.User {
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
      photoUrl: photoURL,
      emailVerified: emailVerified,
    );
  }
}
