import 'package:flutter/material.dart';

const double appBarElevation = 1;

// Colors
MaterialColor primaryColor = Colors.amber;
// <====== Light Colors ======>
Color lightBackgroundColor = Colors.grey.shade50;
// <====== Dark Colors ======>
const Color darkBackgroundColor = Color(0xFF24232F);
const Color darkCardColor = Color(0xFF1E1D26);
const Color darkAppBarColor = Color(0xFF1B1A24);

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
      brightness: Brightness.dark,
      // Colors
      primarySwatch: Colors.amber,
      accentColor: Colors.amber,
      scaffoldBackgroundColor: darkBackgroundColor,
      canvasColor: darkAppBarColor,
      cardColor: darkCardColor,
      dialogBackgroundColor: darkCardColor,
      //
      appBarTheme: const AppBarTheme(
        elevation: appBarElevation,
        color: darkAppBarColor,
      ),
      cardTheme: _cardTheme(
        borderColor: Colors.grey,
        color: darkCardColor,
      ),
      textTheme: _textTheme(),
    );
