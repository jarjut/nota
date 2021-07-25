import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/User.dart';

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

class GoogleSignInCanceled implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({
    fb_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? fb_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final fb_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final userCollection = FirebaseFirestore.instance.collection('users');

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      return user;
    });
  }

  /// Return [User.empty] if not logged in
  Future<User> get firstUserStateChange async {
    var firebaseUser = await _firebaseAuth.authStateChanges().first;
    return firebaseUser == null ? User.empty : firebaseUser.toUser;
  }

  /// Return the current user
  User get currentUser {
    final user = _firebaseAuth.currentUser;
    return user == null ? User.empty : user.toUser;
  }

  /// Signs in with the provided [email] and [password].
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Sign in with Google Account
  Future<void> signInWithGoogle() async {
    fb_auth.UserCredential userCred;
    if (kIsWeb) {
      final googleProvider = fb_auth.GoogleAuthProvider();
      userCred = await _firebaseAuth.signInWithPopup(googleProvider);
    } else {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw GoogleSignInCanceled();
      }
      final googleAuth = await googleUser.authentication;
      final credential = fb_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCred = await _firebaseAuth.signInWithCredential(credential);
    }
    final user = userCred.user?.toUser;

    if (user != null) {
      await userCollection.doc(user.id).get().then((doc) async {
        if (!doc.exists) {
          await userCollection.doc(user.id).set(user.toDocument());
        }
      });
    }
  }

  /// Create a new user account with the given [email] address and [password]
  /// then send an email verification to the user
  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final userCred = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCred.user?.toUser;

    if (user != null) {
      await userCollection
          .doc(user.id)
          .set(user.copyWith(name: name).toDocument());
    }

    await userCred.user?.sendEmailVerification();
  }

  /// Send Verification email to user
  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }

  /// Return refreshed current user
  Future<User> userReload() async {
    var user = _firebaseAuth.currentUser;
    await user?.reload();
    user = _firebaseAuth.currentUser;
    return user == null ? User.empty : user.toUser;
  }

  Future<void> updateUserVerificationStatus(User user) async {
    await userCollection
        .doc(user.id)
        .update({'emailVerified': user.emailVerified});
  }
}

extension on fb_auth.User {
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
      emailVerified: emailVerified,
    );
  }
}
