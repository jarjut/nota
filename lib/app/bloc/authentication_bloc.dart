import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pedantic/pedantic.dart';

import '../../models/user.dart';
import '../../repositories/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AuthenticationState.authenticated(authenticationRepository.currentUser)
              : const AuthenticationState.unauthenticated(),
        ) {
    on<AuthUserChanged>((event, emit) {
      emit(
        event.user.isNotEmpty
            ? AuthenticationState.authenticated(event.user)
            : const AuthenticationState.unauthenticated(),
      );
    });
    on<AuthLogoutRequested>((event, emit) {
      unawaited(_authenticationRepository.logOut());
    });
    on<AuthUserReloadRequested>((event, emit) async {
      final user = await _authenticationRepository.userReload();
      if (state.user != user) {
        add(AuthUserChanged(user));
      }
    });
    _userSubscription = _authenticationRepository.user.listen((_onUserChanged));
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(User user) => add(AuthUserChanged(user));

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
