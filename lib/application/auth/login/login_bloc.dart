import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nota/domain/auth/auth_failure.dart';
import 'package:nota/domain/auth/i_auth_facade.dart';
import 'package:nota/domain/auth/value_objects.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authFacade) : super(LoginState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          emailAddress: EmailAddress(event.value),
          authFailureOrSuccessOption: none(),
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: Password(event.value),
          authFailureOrSuccessOption: none(),
        ),
      );
    });

    on<LoginWithEmailAndPasswordPressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;

      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();

      if (isEmailValid && isPasswordValid) {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );

        failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
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

    on<LoginWithGooglePressed>((event, emit) async {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );
      final failureOrSuccess = await _authFacade.signInWithGoogle();
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
