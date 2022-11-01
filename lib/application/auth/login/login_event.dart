part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.emailChanged(String value) = EmailChanged;

  const factory LoginEvent.passwordChanged(String value) = PasswordChanged;

  const factory LoginEvent.loginWithEmailAndPasswordPressed() =
      LoginWithEmailAndPasswordPressed;

  const factory LoginEvent.loginWithGooglePressed() = LoginWithGooglePressed;
}
