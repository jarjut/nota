import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nota/domain/auth/i_auth_facade.dart';
import 'package:nota/domain/auth/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required IAuthFacade authRepository})
      : _authRepository = authRepository,
        super(
          authRepository.currentUser.isNotEmpty
              ? AuthState.authenticated(authRepository.currentUser)
              : AuthState.unauthenticated(),
        ) {
    // emit a new event whenever the user changes
    _userSubscription = _authRepository.user.listen((user) {
      add(_UserChanged(user));
    });

    // Handle user changed events
    on<_UserChanged>((event, emit) {
      final user = event.user;
      emit(
        user.isNotEmpty
            ? AuthState.authenticated(user)
            : AuthState.unauthenticated(),
      );
    });

    // Handle logout requested events
    on<_LogoutRequested>((event, emit) {
      _authRepository.signOut();
    });

    // Handle user reload requested events
    on<_UserReloadRequested>((event, emit) async {
      final user = await _authRepository.userReload();
      user.fold(
        (failure) => emit(AuthState.unauthenticated()),
        (user) {
          if (state.user != user) {
            add(_UserChanged(user));
          }
        },
      );
    });

    // Handle send email verification requested events
    on<_SendEmailVerification>((event, emit) async {
      await _authRepository.sendEmailVerification();
    });
  }

  final IAuthFacade _authRepository;
  late final StreamSubscription<User> _userSubscription;

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
