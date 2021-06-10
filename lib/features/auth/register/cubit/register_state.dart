part of 'register_cubit.dart';

enum RegisterStatus {
  init,
  loading,
  googleLoading,
  googleCancel,
  done,
  error,
}

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.init,
    this.errorMessage,
  });

  final RegisterStatus status;
  final String? errorMessage;

  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];

  @override
  String toString() => 'RegisterStatus: ${describeEnum(status)}';
}
