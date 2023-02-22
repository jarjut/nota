part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.userChanged(User user) = _UserChanged;
  const factory AuthEvent.logoutRequested() = _LogoutRequested;
  const factory AuthEvent.userReloadRequested() = _UserReloadRequested;
}
