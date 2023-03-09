import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/application/auth/auth_bloc.dart';
import 'package:nota/core/constants/breakpoints.dart';
import 'package:nota/presentation/pages/auth/verify/resend_email.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Reload user every 5 seconds to check if email is verified
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      context.read<AuthBloc>().add(const AuthEvent.userReloadRequested());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return Center(
              child: Container(
                width: kMobileBreakpoint,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Verification link has been sent. Please check your '
                      'email. If you have not received your email please '
                      'check out your spam inbox.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      state.user.email!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const ResendEmail(),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => context
                            .read<AuthBloc>()
                            .add(const AuthEvent.logoutRequested()),
                        child: const Text(
                          'Return to Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
