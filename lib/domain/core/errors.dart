// coverage:ignore-file

import 'package:nota/domain/core/value_failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueError<T> extends Error {
  UnexpectedValueError(this.valueFailure);

  final ValueFailure<T> valueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
