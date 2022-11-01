import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/application/auth/login/login_bloc.dart';
import 'package:nota/injection.dart';
import 'package:nota/presentation/pages/auth/login/widgets/login_form.dart';
import 'package:nota/presentation/pages/auth/wrapper/auth_wrapper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: const AuthWrapper(
        body: LoginForm(),
      ),
    );
  }
}
