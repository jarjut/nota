import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nota/app/app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setPathUrlStrategy();
  runApp(App());
}
