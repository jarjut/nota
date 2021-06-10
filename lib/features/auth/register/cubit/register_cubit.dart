import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../repositories/authentication_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authenticationRepository) : super(const RegisterState());

  final AuthenticationRepository _authenticationRepository;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    try {
      await _authenticationRepository.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(state.copyWith(status: RegisterStatus.done));
    } catch (e) {
      emit(state.copyWith(
        status: RegisterStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
