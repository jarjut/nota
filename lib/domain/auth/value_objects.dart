import 'package:fpdart/fpdart.dart';
import 'package:nota/domain/core/value_failures.dart';
import 'package:nota/domain/core/value_objects.dart';
import 'package:nota/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }
  const EmailAddress._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class Password extends ValueObject<String> {
  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }
  const Password._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class FullName extends ValueObject<String> {
  factory FullName(String input) {
    return FullName._(
      validateMaxStringLength(input, 50),
    );
  }
  const FullName._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
