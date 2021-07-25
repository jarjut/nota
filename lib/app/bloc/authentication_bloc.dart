import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pedantic/pedantic.dart';

import '../../models/User.dart';
import '../../repositories/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AuthenticationState.authenticated(
                  authenticationRepository.currentUser)
              : const AuthenticationState.unauthenticated(),
        ) {
    _userSubscription = _authenticationRepository.user.listen((_onUserChanged));
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(User user) => add(AuthUserChanged(user));

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthUserChanged) {
      yield _mapUserChangedToState(event, state);
    } else if (event is AuthLogoutRequested) {
      unawaited(_authenticationRepository.logOut());
    } else if (event is AuthUserReloadRequested) {
      yield* _mapAuthUserReloadRequestToState(event, state);
    }
  }

  AuthenticationState _mapUserChangedToState(
      AuthUserChanged event, AuthenticationState state) {
    if (event.user.isNotEmpty) {
      _authenticationRepository.updateUserVerificationStatus(event.user);
      return AuthenticationState.authenticated(event.user);
    } else {
      return const AuthenticationState.unauthenticated();
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  Stream<AuthenticationState> _mapAuthUserReloadRequestToState(
    AuthUserReloadRequested event,
    AuthenticationState state,
  ) async* {
    final user = await _authenticationRepository.userReload();
    if (state.user != user) {
      add(AuthUserChanged(user));
    }
  }
}
