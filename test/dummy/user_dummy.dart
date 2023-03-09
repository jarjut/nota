// ignore_for_file: avoid_redundant_argument_values

import 'package:nota/domain/auth/user.dart';

import '../helpers/helpers.dart';
import 'dummy_document_snapshot.dart';

const dummyUser = User(
  id: 'id',
  email: 'email@test.com',
  emailVerified: true,
  name: 'dummy name',
  photoUrl: 'https://dummy.com',
);

final dummyFirebaseUser = MockFirebaseUser(
  uid: 'id',
  email: 'email@test.com',
  emailVerified: true,
  displayName: 'dummy name',
  photoURL: 'https://dummy.com',
);

final dummyUserJson = {
  'email': 'email@test.com',
  'emailVerified': true,
  'name': 'dummy name',
  'photo': 'https://dummy.com',
};

final dummyUserSnapshot = DummyDocumentSnapshot('id', dummyUserJson);
