part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.fullNameChanged(String value) = _FullNameChanged;
  const factory RegisterEvent.emailChanged(String value) = _EmailChanged;
  const factory RegisterEvent.passwordChanged(String value) = _PasswordChanged;
  const factory RegisterEvent.registerWithEmailAndPasswordPressed() =
      _RegisterWithEmailAndPasswordPressed;
  const factory RegisterEvent.loginWithGooglePressed() =
      _LoginWithGooglePressed;
}
