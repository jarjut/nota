import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:meta/meta.dart';
import 'package:nota/domain/core/errors.dart';
import 'package:nota/domain/core/value_failures.dart';

@immutable
abstract class ValueObject<T> extends Equatable {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() {
    return value.isRight();
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'Value($value)';
}
