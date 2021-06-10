import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../repositories/authentication_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
          email: email, password: password);
      emit(state.copyWith(status: LoginStatus.done));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
        status: LoginStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: LoginStatus.googleLoading));
    try {
      await _authenticationRepository.signInWithGoogle();
      emit(state.copyWith(status: LoginStatus.done));
    } on GoogleSignInCanceled {
      emit(state.copyWith(status: LoginStatus.googleCancel));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
        status: LoginStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
