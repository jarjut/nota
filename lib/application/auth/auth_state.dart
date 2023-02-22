part of 'auth_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthenticationStatus status,
    @Default(User.empty) User user,
  }) = _AuthState;

  const AuthState._();

  factory AuthState.authenticated(User user) => AuthState(
        status: AuthenticationStatus.authenticated,
        user: user,
      );

  factory AuthState.unauthenticated() => const AuthState(
        status: AuthenticationStatus.unauthenticated,
      );

  @override
  String toString() {
    if (status == AuthenticationStatus.authenticated) {
      return 'AuthState(status: Authenticated, userEmail: ${user.email})';
    }
    return 'AuthState(status: Unauthenticated)';
  }
}
