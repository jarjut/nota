part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthLogoutRequested extends AuthenticationEvent {}

class AuthUserChanged extends AuthenticationEvent {
  const AuthUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
