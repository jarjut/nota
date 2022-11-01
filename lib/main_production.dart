import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nota/bootstrap.dart';
import 'package:nota/injection.dart';
import 'package:nota/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await bootstrap(() => const App());
}
