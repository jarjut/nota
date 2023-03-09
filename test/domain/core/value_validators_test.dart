// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nota/domain/core/value_failures.dart';
import 'package:nota/domain/core/value_validators.dart';

void main() {
  group('ValueValidators', () {
    group('validateMaxStringLength', () {
      test('valid', () {
        const input = 'Hello';
        final result = validateMaxStringLength(input, 20);

        expect(result, right(input));
      });

      test('not valid', () {
        const input = "Hello, I'm a long string";
        final result = validateMaxStringLength(input, 20);

        expect(
          result,
          left(
            const ValueFailure.exceedingLength(
              failedValue: input,
              max: 20,
            ),
          ),
        );
      });
    });

    group('validateStringNotEmpty', () {
      test('valid', () {
        const input = 'Hello';
        final result = validateStringNotEmpty(input);

        expect(result, right(input));
      });

      test('not valid', () {
        const input = '';
        final result = validateStringNotEmpty(input);

        expect(
          result,
          left(
            const ValueFailure.empty(
              failedValue: input,
            ),
          ),
        );
      });
    });

    group('validateEmailAddress', () {
      test('valid', () {
        const input = 'valid@email.com';
        final resuilt = validateEmailAddress(input);

        expect(resuilt, right(input));
      });

      test('not valid', () {
        const input = 'invalid';
        final result = validateEmailAddress(input);

        expect(
          result,
          left(
            const ValueFailure.invalidEmail(
              failedValue: input,
            ),
          ),
        );
      });
    });

    group('validatePassword', () {
      test('valid', () {
        const input = 'validPassword';
        final result = validatePassword(input);

        expect(result, right(input));
      });

      test('not valid', () {
        const input = 'short';
        final result = validatePassword(input);

        expect(
          result,
          left(
            const ValueFailure.shortPassword(
              failedValue: input,
            ),
          ),
        );
      });
    });
  });
}
