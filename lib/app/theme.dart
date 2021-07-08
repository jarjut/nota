import 'package:flutter/material.dart';

const double appBarElevation = 1;

CardTheme _cardTheme({
  Color borderColor = const Color(0xFFE0E0E0),
  Color color = Colors.white,
}) {
  return CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(
        color: borderColor,
        width: 0.75,
      ),
    ),
    color: color,
    elevation: 0,
  );
}

TextTheme _textTheme() {
  return const TextTheme(
    headline6: TextStyle(
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      fontSize: 18.0,
    ),
  );
}

ThemeData AppTheme() => ThemeData(
      primarySwatch: Colors.amber,
      scaffoldBackgroundColor: Colors.grey.shade50,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade50,
        elevation: appBarElevation,
      ),
      cardTheme: _cardTheme(
        color: Colors.grey.shade50,
        borderColor: Colors.grey.shade400,
      ),
      textTheme: _textTheme(),
    );

ThemeData DarkTheme() => ThemeData(
      primarySwatch: Colors.amber,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        elevation: appBarElevation,
      ),
      cardTheme: _cardTheme(
        borderColor: Colors.grey,
        color: Colors.grey[850]!,
      ),
      textTheme: _textTheme(),
    );
