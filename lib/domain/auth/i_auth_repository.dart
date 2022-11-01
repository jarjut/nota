import 'package:fpdart/fpdart.dart';
import 'package:nota/domain/auth/auth_failure.dart';
import 'package:nota/domain/auth/value_objects.dart';

typedef AuthFacadeEmailAndPasswordCallback = Future<Either<AuthFailure, Unit>>
    Function({
  required EmailAddress emailAddress,
  required Password password,
});

/// Interface for all authentication related operations.
abstract class IAuthRepository {
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

  /// Signs in a user with Google.
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  /// Signs out the current user.
  Future<void> signOut();
}
