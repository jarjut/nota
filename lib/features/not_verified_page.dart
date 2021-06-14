import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/bloc/authentication_bloc.dart';
import '../repositories/authentication_repository.dart';
import '../utils/debouncer.dart';

class NotVerifiedPage extends StatefulWidget {
  const NotVerifiedPage({Key? key}) : super(key: key);

  @override
  _NotVerifiedPageState createState() => _NotVerifiedPageState();
}

class _NotVerifiedPageState extends State<NotVerifiedPage> {
  Timer? timer;
  Debouncer resendDebouncer = Debouncer(duration: const Duration(seconds: 60));
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      BlocProvider.of<AuthenticationBloc>(context)
          .add(AuthUserReloadRequested());
    });
    super.initState();
  }

  @override
  void dispose() {
    resendDebouncer.cancel();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Verify Email'),
        ),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Verification link has been sent. Please check your email. If you have not received your email please check out your spam inbox.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      state.user.email!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    InkWell(
                      onTap: () {
                        resendDebouncer.run(() {
                          RepositoryProvider.of<AuthenticationRepository>(
                                  context)
                              .sendEmailVerification();
                        });
                      },
                      child: const Text(
                        'Resend email',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(AuthLogoutRequested()),
                        child: const Text('Return to Sign In'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
