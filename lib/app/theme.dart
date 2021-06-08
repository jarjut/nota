import 'package:flutter/material.dart';

ThemeData AppTheme() => ThemeData(
      primarySwatch: Colors.amber,
      scaffoldBackgroundColor: Colors.grey.shade200,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade200,
        elevation: 2,
      ),
    );

ThemeData DarkTheme() => ThemeData.dark();
