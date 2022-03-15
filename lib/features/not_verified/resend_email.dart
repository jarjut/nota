import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/authentication_repository.dart';

class ResendEmail extends StatefulWidget {
  const ResendEmail({Key? key}) : super(key: key);

  @override
  _ResendEmailState createState() => _ResendEmailState();
}

class _ResendEmailState extends State<ResendEmail> {
  bool canResend = true;
  int count = 60;
  int currentCount = 60;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      currentCount = count;
      canResend = false;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentCount == 0) {
        setState(() {
          timer.cancel();
          canResend = true;
        });
      } else {
        setState(() {
          currentCount--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: canResend
          ? () {
              startTimer();
              RepositoryProvider.of<AuthenticationRepository>(context).sendEmailVerification();
            }
          : null,
      child: RichText(
          text: TextSpan(
        text: 'Resend Email ',
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: canResend ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
        ),
        children: [
          canResend ? const TextSpan() : TextSpan(text: currentCount.toString()),
        ],
      )),
    );
  }
}
