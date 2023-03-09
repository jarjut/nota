import 'package:fpdart/fpdart.dart';
import 'package:nota/domain/auth/auth_failure.dart';
import 'package:nota/domain/auth/user.dart';
import 'package:nota/domain/auth/value_objects.dart';

/// Interface for all authentication related operations.
abstract class IAuthFacade {
  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user;

  /// Returns the current user.
  User get currentUser;

  /// Return refreshed user data.
  Future<Either<AuthFailure, User>> userReload();

  /// Registers a new user with the given email and password.
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required FullName fullName,
    required EmailAddress emailAddress,
    required Password password,
  });

  /// Signs in a user with the given email and password.
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  /// Send a verification email to the current user.
  Future<Either<AuthFailure, Unit>> sendEmailVerification();

  /// Signs in a user with Google.
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  /// Signs out the current user.
  Future<Either<AuthFailure, Unit>> signOut();
}
