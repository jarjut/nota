import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/application/auth/register/register_bloc.dart';
import 'package:nota/injection.dart';
import 'package:nota/presentation/pages/auth/register/widgets/register_form.dart';
import 'package:nota/presentation/pages/auth/wrapper/auth_wrapper.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterBloc>(),
      child: const AuthWrapper(
        body: RegisterForm(),
      ),
    );
  }
}
