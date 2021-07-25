import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../repositories/authentication_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authenticationRepository) : super(const RegisterState());

  final AuthenticationRepository _authenticationRepository;

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    try {
      await _authenticationRepository.createUserWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      emit(state.copyWith(status: RegisterStatus.done));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
        status: RegisterStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: RegisterStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: RegisterStatus.googleLoading));
    try {
      await _authenticationRepository.signInWithGoogle();
      emit(state.copyWith(status: RegisterStatus.done));
    } on GoogleSignInCanceled {
      emit(state.copyWith(status: RegisterStatus.googleCancel));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
        status: RegisterStatus.error,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: RegisterStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
