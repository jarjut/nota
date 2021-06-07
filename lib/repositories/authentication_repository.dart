import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:nota/models/User.dart';

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({
    fb_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? fb_auth.FirebaseAuth.instance;

  final fb_auth.FirebaseAuth _firebaseAuth;

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

  /// Creates a new user with the provided [email] and [password].
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on fb_auth.FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// Signs in with the provided [email] and [password].
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on fb_auth.FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } on Exception {
      throw LogOutFailure();
    }
  }
}

extension on fb_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
