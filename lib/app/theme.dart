import 'package:flutter/material.dart';

const double appBarElevation = 2;

ThemeData AppTheme() => ThemeData(
      primarySwatch: Colors.amber,
      scaffoldBackgroundColor: Colors.grey.shade200,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade200,
        elevation: appBarElevation,
      ),
    );

ThemeData DarkTheme() => ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        elevation: appBarElevation,
      ),
    );
