part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.emailChanged(String value) = _EmailChanged;

  const factory LoginEvent.passwordChanged(String value) = _PasswordChanged;

  const factory LoginEvent.loginWithEmailAndPasswordPressed() =
      _LoginWithEmailAndPasswordPressed;

  const factory LoginEvent.loginWithGooglePressed() = _LoginWithGooglePressed;
}
