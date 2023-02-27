import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nota/domain/auth/auth_failure.dart';
import 'package:nota/domain/auth/i_auth_facade.dart';
import 'package:nota/domain/auth/value_objects.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._authFacade) : super(RegisterState.initial()) {
    on<_FullNameChanged>((event, emit) {
      emit(
        state.copyWith(
          fullName: FullName(event.value),
          authFailureOrSuccessOption: none(),
        ),
      );
    });

    on<_EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          emailAddress: EmailAddress(event.value),
          authFailureOrSuccessOption: none(),
        ),
      );
    });

    on<_PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: Password(event.value),
          authFailureOrSuccessOption: none(),
        ),
      );
    });

    on<_RegisterWithEmailAndPasswordPressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;

      final isFullNameValid = state.fullName.isValid();
      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();

      if (isFullNameValid && isEmailValid && isPasswordValid) {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );

        failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
          fullName: state.fullName,
          emailAddress: state.emailAddress,
          password: state.password,
        );

        emit(
          state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          ),
        );
      }

      emit(
        state.copyWith(
          showErrorMessage: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
    });

    on<_LoginWithGooglePressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;

      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _authFacade.signInWithGoogle();

      emit(
        state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSuccess),
        ),
      );
    });
  }
  final IAuthFacade _authFacade;
}
