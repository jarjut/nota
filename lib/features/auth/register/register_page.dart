import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/auth/widgets/google_button.dart';
import 'package:vrouter/vrouter.dart';

import '../../../app/app_route.dart';
import '../../../repositories/authentication_repository.dart';
import '../widgets/password_form_field.dart';
import 'cubit/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            RegisterCubit(context.read<AuthenticationRepository>()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _RegisterFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.done) {
          context.vRouter.push('/');
        }
        if (state.status == RegisterStatus.error) {
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
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Form(
            key: _RegisterFormKey,
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
                  child: _buildRegisterButton(state, context),
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () =>
                      VRouter.of(context).pushNamed(AppRoute.LoginRoute),
                  child: const Text(
                    'Already have an account',
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
                    isLoading: state.status == RegisterStatus.googleLoading,
                    onPressed: () => BlocProvider.of<RegisterCubit>(context)
                        .signInWithGoogle(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ElevatedButton _buildRegisterButton(
      RegisterState state, BuildContext context) {
    void Function()? onPressed;
    Widget? child;

    if (state.status == RegisterStatus.loading) {
      onPressed = null;
      child = const SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          strokeWidth: 3,
        ),
      );
    } else {
      onPressed = () => context
          .read<RegisterCubit>()
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      child = const Text('REGISTER');
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
