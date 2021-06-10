import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/auth/widgets/google_button.dart';
import 'package:vrouter/vrouter.dart';

import '../../../app/app_route.dart';
import '../../../repositories/authentication_repository.dart';
import '../widgets/password_form_field.dart';
import 'cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            LoginCubit(context.read<AuthenticationRepository>()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

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
        if (state.status == LoginStatus.done) {
          context.vRouter.push('/');
        }
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
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: _buildLoginButton(state, context),
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () =>
                      VRouter.of(context).pushNamed(AppRoute.RegisterRoute),
                  child: const Text(
                    'Create new account',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'or',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: GoogleButton(
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

  ElevatedButton _buildLoginButton(LoginState state, BuildContext context) {
    void Function()? onPressed;
    Widget? child;

    if (state.status == LoginStatus.loading) {
      onPressed = null;
      child = const SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          strokeWidth: 3,
        ),
      );
    } else {
      onPressed = () => context.read<LoginCubit>().logInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      child = const Text('LOGIN');
    }
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
