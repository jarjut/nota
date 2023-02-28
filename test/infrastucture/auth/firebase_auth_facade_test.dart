// ignore_for_file: inference_failure_on_function_invocation

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nota/domain/auth/auth_failure.dart';
import 'package:nota/domain/auth/user.dart';
import 'package:nota/domain/auth/value_objects.dart';
import 'package:nota/infrastructure/auth/firebase_auth_facade.dart';

import '../../dummy/dummy.dart';
import '../../helpers/helpers.dart';

class FakeAuthProvider extends Fake implements AuthProvider {}

class FakeAuthCredential extends Fake implements AuthCredential {}

void main() {
  group('FirebaseAuthFacade', () {
    late FirebaseAuthFacade firebaseAuthFacade;
    late GoogleSignIn mockGoogleSignIn;
    late fb_auth.FirebaseAuth mockFirebaseAuth;
    late FirebaseFirestore mockFirestore;
    late CollectionReference<Map<String, dynamic>> mockCollectionReference;
    late DocumentReference<Map<String, dynamic>> mockDocumentReference;

    setUp(() {
      mockGoogleSignIn = MockGoogleSignIn();
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirestore = MockFirebaseFirestore();
      firebaseAuthFacade = FirebaseAuthFacade(
        mockFirebaseAuth,
        mockGoogleSignIn,
        mockFirestore,
      );
      mockCollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();
    });

    setUpAll(() {
      registerFallbackValue(FakeAuthProvider());
      registerFallbackValue(FakeAuthCredential());
    });

    test('get currentUser should return a User entity', () {
      when(() => mockFirebaseAuth.currentUser)
          .thenAnswer((_) => dummyFirebaseUser);

      final user = firebaseAuthFacade.currentUser;

      expect(user, dummyUser);
    });

    group('user', () {
      test('emits User when firebase user not null', () async {
        when(() => mockFirebaseAuth.authStateChanges())
            .thenAnswer((_) => Stream.value(dummyFirebaseUser));
        await expectLater(firebaseAuthFacade.user, emitsInOrder([dummyUser]));
      });

      test('emits User.empty when firebase user is null', () {
        when(() => mockFirebaseAuth.authStateChanges())
            .thenAnswer((_) => Stream.value(null));
        expect(firebaseAuthFacade.user, emitsInOrder([User.empty]));
      });
    });

    group('userReload', () {
      test('return a User entity after reload data', () async {
        when(() => mockFirebaseAuth.currentUser)
            .thenAnswer((_) => dummyFirebaseUser);
        when(dummyFirebaseUser.reload).thenAnswer((_) async {});

        final user = await firebaseAuthFacade.userReload();

        expect(user, right(dummyUser));
      });

      test('return AuthFailure when reload error', () async {
        when(() => mockFirebaseAuth.currentUser)
            .thenAnswer((_) => dummyFirebaseUser);
        when(dummyFirebaseUser.reload).thenThrow((_) => Exception());

        final user = await firebaseAuthFacade.userReload();

        expect(user, left(const AuthFailure.serverError()));
      });
    });

    group('registerWithEmailAndPassword', () {
      setUp(() {
        when(() => mockFirestore.collection(any()))
            .thenAnswer((_) => mockCollectionReference);
        when(() => mockCollectionReference.doc(any()))
            .thenAnswer((_) => mockDocumentReference);
      });

      test('succeds when register', () async {
        final userCred = MockUserCredential();
        when(
          () => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => userCred);

        when(() => userCred.user).thenAnswer((_) => dummyFirebaseUser);
        when(() => mockDocumentReference.set(any()))
            .thenAnswer((_) async => {});
        when(dummyFirebaseUser.sendEmailVerification).thenAnswer((_) async {});

        final result = await firebaseAuthFacade.registerWithEmailAndPassword(
          fullName: FullName('dummy name'),
          emailAddress: EmailAddress('email@test.com'),
          password: Password('123456'),
        );

        expect(result, right(unit));
        verify(
          () => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).called(1);
      });

      test('return AuthFailure when email already in use', () async {
        when(
          () => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

        final result = await firebaseAuthFacade.registerWithEmailAndPassword(
          fullName: FullName('dummy name'),
          emailAddress: EmailAddress('email@test.com'),
          password: Password('123456'),
        );
        expect(result, left(const AuthFailure.emailAlreadyInUse()));
      });

      test('return AuthFailure when server error', () async {
        when(
          () => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(FirebaseAuthException(code: 'code'));

        final result = await firebaseAuthFacade.registerWithEmailAndPassword(
          fullName: FullName('dummy name'),
          emailAddress: EmailAddress('email@test.com'),
          password: Password('123456'),
        );
        expect(result, left(const AuthFailure.serverError()));
      });

      test('return AuthFailure when server error', () async {
        when(
          () => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception());

        final result = await firebaseAuthFacade.registerWithEmailAndPassword(
          fullName: FullName('dummy name'),
          emailAddress: EmailAddress('email@test.com'),
          password: Password('123456'),
        );
        expect(result, left(const AuthFailure.serverError()));
      });
    });

    group('signInWithEmailAndPassword', () {
      test('succeds when signIn', () async {
        when(
          () => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => MockUserCredential());

        final result = await firebaseAuthFacade.signInWithEmailAndPassword(
          emailAddress: EmailAddress('email@test.com'),
          password: Password('123456'),
        );

        expect(result, right(unit));
        verify(
          () => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).called(1);
      });

      test('return AuthFailure when user input wrong credentials', () async {
        when(
          () => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(FirebaseAuthException(code: 'user-not-found'));

        final result = await firebaseAuthFacade.signInWithEmailAndPassword(
          emailAddress: EmailAddress('email@test.com'),
          password: Password('123456'),
        );

        expect(
          result,
          left(const AuthFailure.invalidEmailAndPasswordCombination()),
        );
      });

      test('return AuthFailure when server error', () async {
        when(
          () => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(FirebaseAuthException(code: 'code'));

        final result = await firebaseAuthFacade.signInWithEmailAndPassword(
          emailAddress: EmailAddress('email@test.com'),
          password: Password('123456'),
        );

        expect(
          result,
          left(const AuthFailure.serverError()),
        );
      });

      test('return AuthFailure when server error', () async {
        when(
          () => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception());

        final result = await firebaseAuthFacade.signInWithEmailAndPassword(
          emailAddress: EmailAddress('email@test.com'),
          password: Password('123456'),
        );

        expect(
          result,
          left(const AuthFailure.serverError()),
        );
      });
    });

    group('signInWithGoogle', () {
      final userCred = MockUserCredential();
      final mockDocSnapshot = MockDocumentSnapshot();
      final mockGoogleSignInAccount = MockGoogleSignInAccount();
      final mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();

      setUp(() {
        // Firestore User
        when(() => mockFirestore.collection(any()))
            .thenAnswer((_) => mockCollectionReference);
        when(() => mockCollectionReference.doc(any()))
            .thenAnswer((_) => mockDocumentReference);
        when(() => mockDocumentReference.get())
            .thenAnswer((_) async => mockDocSnapshot);
        // UserCredential User
        when(() => userCred.user).thenAnswer((_) => dummyFirebaseUser);
        // GoogleAuth Info
        when(() => mockGoogleSignInAuthentication.accessToken)
            .thenReturn('accessToken');
        when(() => mockGoogleSignInAuthentication.idToken)
            .thenReturn('idToken');
      });

      test('succeds when signIn on web', () async {
        firebaseAuthFacade.isWeb = true;
        when(() => mockFirebaseAuth.signInWithPopup(any()))
            .thenAnswer((_) async => userCred);
        // User exist
        when(() => mockDocSnapshot.exists).thenReturn(true);

        final result = await firebaseAuthFacade.signInWithGoogle();

        expect(result, right(unit));
        verify(() => mockFirebaseAuth.signInWithPopup(any())).called(1);
        verifyNever(() => mockFirebaseAuth.signInWithCredential(any()));
      });

      test('succeds when signIn on mobile', () async {
        firebaseAuthFacade.isWeb = false;
        when(() => mockGoogleSignIn.signIn())
            .thenAnswer((_) async => mockGoogleSignInAccount);
        when(() => mockGoogleSignInAccount.authentication)
            .thenAnswer((_) async => mockGoogleSignInAuthentication);
        when(() => mockFirebaseAuth.signInWithCredential(any()))
            .thenAnswer((_) async => userCred);
        // User exist
        when(() => mockDocSnapshot.exists).thenReturn(true);

        final result = await firebaseAuthFacade.signInWithGoogle();

        expect(result, right(unit));
        verify(() => mockGoogleSignIn.signIn()).called(1);
        verify(() => mockFirebaseAuth.signInWithCredential(any())).called(1);
        verifyNever(() => mockFirebaseAuth.signInWithPopup(any()));
      });

      test('register userInfo if user not exist', () async {
        firebaseAuthFacade.isWeb = false;
        when(() => mockGoogleSignIn.signIn())
            .thenAnswer((_) async => mockGoogleSignInAccount);
        when(() => mockGoogleSignInAccount.authentication)
            .thenAnswer((_) async => mockGoogleSignInAuthentication);
        when(() => mockFirebaseAuth.signInWithCredential(any()))
            .thenAnswer((_) async => userCred);
        // User not exist
        when(() => mockDocSnapshot.exists).thenReturn(false);
        when(() => mockDocumentReference.set(any())).thenAnswer((_) async {});

        final result = await firebaseAuthFacade.signInWithGoogle();

        expect(result, right(unit));
        verify(() => mockDocumentReference.set(any())).called(1);
      });

      test('return AuthFailure when user cancel auth', () async {
        firebaseAuthFacade.isWeb = false;
        when(() => mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

        final result = await firebaseAuthFacade.signInWithGoogle();

        expect(result, left(const AuthFailure.cancelledByUser()));
      });

      test(
        'return AuthFailure when account already exist with different '
        'credentials',
        () async {
          firebaseAuthFacade.isWeb = false;
          when(() => mockGoogleSignIn.signIn())
              .thenAnswer((_) async => mockGoogleSignInAccount);
          when(() => mockGoogleSignInAccount.authentication)
              .thenAnswer((_) async => mockGoogleSignInAuthentication);
          when(() => mockFirebaseAuth.signInWithCredential(any())).thenThrow(
            FirebaseAuthException(
              code: 'account-exists-with-different-credential',
            ),
          );

          final result = await firebaseAuthFacade.signInWithGoogle();

          expect(result, left(const AuthFailure.emailAlreadyInUse()));
        },
      );

      test('return AuthFailure when server error', () async {
        firebaseAuthFacade.isWeb = false;
        when(() => mockGoogleSignIn.signIn())
            .thenAnswer((_) async => mockGoogleSignInAccount);
        when(() => mockGoogleSignInAccount.authentication)
            .thenAnswer((_) async => mockGoogleSignInAuthentication);
        when(() => mockFirebaseAuth.signInWithCredential(any()))
            .thenThrow(Exception());

        final result = await firebaseAuthFacade.signInWithGoogle();

        expect(result, left(const AuthFailure.serverError()));
      });

      test('return AuthFailure when server error', () async {
        firebaseAuthFacade.isWeb = false;
        when(() => mockGoogleSignIn.signIn())
            .thenAnswer((_) async => mockGoogleSignInAccount);
        when(() => mockGoogleSignInAccount.authentication)
            .thenAnswer((_) async => mockGoogleSignInAuthentication);
        when(() => mockFirebaseAuth.signInWithCredential(any()))
            .thenThrow(FirebaseAuthException(code: 'code'));

        final result = await firebaseAuthFacade.signInWithGoogle();

        expect(result, left(const AuthFailure.serverError()));
      });
    });

    group('signOut', () {
      test('succeds', () async {
        when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async {});
        when(() => mockGoogleSignIn.signOut()).thenAnswer((_) async => null);

        final result = await firebaseAuthFacade.signOut();

        expect(result, right(unit));
      });

      test('return AuthFailure when server error', () async {
        when(() => mockFirebaseAuth.signOut()).thenThrow(Exception());

        final result = await firebaseAuthFacade.signOut();

        expect(result, left(const AuthFailure.serverError()));
      });
    });

    group('sendEmailVerification', () {
      setUp(() {
        when(() => mockFirebaseAuth.currentUser)
            .thenAnswer((_) => dummyFirebaseUser);
      });

      test('succeds', () async {
        when(dummyFirebaseUser.sendEmailVerification)
            .thenAnswer((_) async => {});

        final result = await firebaseAuthFacade.sendEmailVerification();

        expect(result, right(unit));
      });

      test('return AuthFailure when server error', () async {
        when(dummyFirebaseUser.sendEmailVerification).thenThrow(Exception());

        final result = await firebaseAuthFacade.sendEmailVerification();

        expect(result, left(const AuthFailure.serverError()));
      });
    });
  });
}
