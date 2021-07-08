import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../app/app_route.dart';
import '../../widgets/auth_button_primary.dart';
import '../../widgets/auth_text_form_field.dart';
import '../../widgets/google_button_primary.dart';
import '../../widgets/password_form_field.dart';
import '../cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage.toString()),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthTextFormField(
                  controller: _emailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 12),
                AuthPasswordFormField(
                  controller: _passwordController,
                  hintText: 'Password',
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: AuthButtonPrimary(
                    isLoading: state.status == LoginStatus.loading,
                    onPressed: () => context
                        .read<LoginCubit>()
                        .logInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text),
                    label: 'LOGIN',
                  ),
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () =>
                      VRouter.of(context).toNamed(AppRoute.RegisterRoute),
                  child: Text(
                    'Create new account',
                    style: TextStyle(
                      color: Colors.amber.shade100.withAlpha(200),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
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
                    isLoading: state.status == LoginStatus.googleLoading,
                    onPressed: () =>
                        BlocProvider.of<LoginCubit>(context).signInWithGoogle(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
