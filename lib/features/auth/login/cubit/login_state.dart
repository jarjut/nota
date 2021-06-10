part of 'login_cubit.dart';

enum LoginStatus {
  init,
  loading,
  googleLoading,
  googleCancel,
  done,
  error,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.init,
    this.errorMessage,
  });

  final LoginStatus status;
  final String? errorMessage;

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];

  @override
  String toString() => 'LoginStatus: ${describeEnum(status)}';
}
