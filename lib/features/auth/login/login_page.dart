import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/auth/auth_wrapper.dart';

import '../../../repositories/authentication_repository.dart';
import 'cubit/login_cubit.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
      child: const AuthWrapper(
        child: LoginForm(),
      ),
    );
  }
}
