// ignore_for_file: subtype_of_sealed_class

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {}

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseUser extends Mock implements User {
  MockFirebaseUser({
    required String uid,
    String? email,
    bool emailVerified = false,
    String? displayName,
    String? photoURL,
  })  : _uid = uid,
        _email = email,
        _emailVerified = emailVerified,
        _displayName = displayName,
        _photoURL = photoURL;

  final String _uid;
  final String? _email;
  final bool _emailVerified;
  final String? _displayName;
  final String? _photoURL;

  @override
  String get uid => _uid;

  @override
  String? get email => _email;

  @override
  bool get emailVerified => _emailVerified;

  @override
  String? get displayName => _displayName;

  @override
  String? get photoURL => _photoURL;
}
