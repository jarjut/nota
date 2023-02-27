import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/application/auth/register/register_bloc.dart';
import 'package:nota/presentation/l10n/l10n.dart';
import 'package:nota/presentation/pages/auth/widgets/auth_button_primary.dart';
import 'package:nota/presentation/pages/auth/widgets/auth_text_form_field.dart';
import 'package:nota/presentation/pages/auth/widgets/google_button_primary.dart';
import 'package:nota/presentation/pages/auth/widgets/password_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => null,
          (either) {
            either.fold(
              (failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        failure.map(
                          cancelledByUser: (_) =>
                              context.l10n.authErrorCancelledByUser,
                          serverError: (_) => context.l10n.authErrorServerError,
                          emailAlreadyInUse: (_) =>
                              context.l10n.authErrorEmailAlreadyInUse,
                          invalidEmailAndPasswordCombination: (_) => context
                              .l10n.authErrorInvalidEmailAndPasswordCombination,
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              },
              (_) {},
            );
          },
        );
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          final registerBloc = context.read<RegisterBloc>();
          final autovalidateMode = state.showErrorMessage
              ? AutovalidateMode.always
              : AutovalidateMode.disabled;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTextFormField(
                autovalidateMode: autovalidateMode,
                hintText: context.l10n.authFormFullNameLabel,
                onChanged: (value) =>
                    registerBloc.add(RegisterEvent.fullNameChanged(value)),
                validator: (_) => state.fullName.value.fold(
                  (f) => f.maybeMap(
                    exceedingLength: (value) =>
                        'Exceeding length ${value.max} characters',
                    orElse: () => 'Invalid name',
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 12),
              AuthTextFormField(
                autovalidateMode: autovalidateMode,
                hintText: context.l10n.authFormEmailLabel,
                onChanged: (value) =>
                    registerBloc.add(RegisterEvent.emailChanged(value)),
                validator: (_) => state.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) =>
                        context.l10n.authValidationEmailInvalid,
                    orElse: () => context.l10n.authValidationEmailInvalid,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 12),
              AuthPasswordFormField(
                autovalidateMode: autovalidateMode,
                hintText: context.l10n.authFormPasswordLabel,
                onChanged: (value) =>
                    registerBloc.add(RegisterEvent.passwordChanged(value)),
                validator: (_) => state.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) =>
                        context.l10n.authValidationPasswordTooShort,
                    orElse: () => 'Invalid password',
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: AuthButtonPrimary(
                  isLoading: state.isSubmitting,
                  onPressed: () => registerBloc.add(
                    const RegisterEvent.registerWithEmailAndPasswordPressed(),
                  ),
                  label: context.l10n.register.toUpperCase(),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => context.go('/login'),
                child: Text(
                  context.l10n.authToLoginPageText,
                  style: TextStyle(
                    color: Colors.amber.shade100.withAlpha(200),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white38,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.white38,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: GoogleButtonPrimary(
                  isLoading: state.isSubmitting,
                  onPressed: () => registerBloc.add(
                    const RegisterEvent.loginWithGooglePressed(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
