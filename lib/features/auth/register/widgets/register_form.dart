import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../app/app_route.dart';
import '../../widgets/auth_button_primary.dart';
import '../../widgets/auth_text_form_field.dart';
import '../../widgets/google_button_primary.dart';
import '../../widgets/password_form_field.dart';
import '../cubit/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _RegisterFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
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
                AuthTextFormField(
                  controller: _nameController,
                  hintText: 'Full Name',
                ),
                const SizedBox(height: 12),
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
                    isLoading: state.status == RegisterStatus.loading,
                    onPressed: () => context
                        .read<RegisterCubit>()
                        .createUserWithEmailAndPassword(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text),
                    label: 'REGISTER',
                  ),
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () => VRouter.of(context).toNamed(AppRoute.LoginRoute),
                  child: Text(
                    'Already have an account',
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

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
