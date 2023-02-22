import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/application/auth/login/login_bloc.dart';
import 'package:nota/presentation/pages/auth/widgets/auth_button_primary.dart';
import 'package:nota/presentation/pages/auth/widgets/auth_text_form_field.dart';
import 'package:nota/presentation/pages/auth/widgets/google_button_primary.dart';
import 'package:nota/presentation/pages/auth/widgets/password_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
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
                          cancelledByUser: (_) => 'Login Cancelled',
                          serverError: (_) => 'Server Error',
                          emailAlreadyInUse: (_) => 'Email Already In Use',
                          invalidEmailAndPasswordCombination: (_) =>
                              'Invalid Email And Password Combination',
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              },
              (_) {
                // TODO: Navigate to home page
              },
            );
          },
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessage
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTextFormField(
                hintText: 'Email',
                onChanged: (value) => context
                    .read<LoginBloc>()
                    .add(LoginEvent.emailChanged(value)),
                validator: (_) => state.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email',
                    orElse: () => null,
                  ),
                  (r) => null,
                ),
              ),
              const SizedBox(height: 12),
              AuthPasswordFormField(
                onChanged: (value) => context
                    .read<LoginBloc>()
                    .add(LoginEvent.passwordChanged(value)),
                validator: (_) => state.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) => 'Short Password',
                    orElse: () => null,
                  ),
                  (r) => null,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: AuthButtonPrimary(
                  isLoading: state.isSubmitting,
                  onPressed: () => context
                      .read<LoginBloc>()
                      .add(const LoginEvent.loginWithEmailAndPasswordPressed()),
                  label: 'LOGIN',
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  // TODO: Navigate to register page
                },
                child: Text(
                  'Create new account',
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
                  onPressed: () => context
                      .read<LoginBloc>()
                      .add(const LoginEvent.loginWithGooglePressed()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
