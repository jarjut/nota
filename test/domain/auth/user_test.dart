import 'package:flutter_test/flutter_test.dart';
import 'package:nota/domain/auth/user.dart';

import '../../dummy/dummy.dart';

void main() {
  group('User Entity', () {
    const user = dummyUser;
    final userSnapshot = dummyUserSnapshot;
    test('isEmpty', () {
      const emptyUser = User.empty;
      expect(emptyUser.isEmpty, true);
    });

    test('isNotEmpty', () {
      expect(user.isNotEmpty, true);
    });

    test('fromSnapshot', () {
      expect(user, User.fromSnapshot(userSnapshot));
    });

    test('toDocument', () {
      expect(dummyUserJson, user.toDocument());
    });
  });
}
