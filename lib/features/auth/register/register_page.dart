import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/authentication_repository.dart';
import '../wrapper/auth_wrapper.dart';
import 'cubit/register_cubit.dart';
import 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(context.read<AuthenticationRepository>()),
      child: const AuthWrapper(
        body: RegisterForm(),
      ),
    );
  }
}
