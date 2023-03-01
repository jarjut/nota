import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nota/bootstrap.dart';
import 'package:nota/firebase_options.dart';
import 'package:nota/injection.dart';
import 'package:nota/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureInjection(Environment.dev);
  await bootstrap(() => const App());
}
