part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessage,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessage: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
