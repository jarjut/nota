part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required FullName fullName,
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessage,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _RegisterState;

  factory RegisterState.initial() => RegisterState(
        fullName: FullName(''),
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessage: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
