import 'package:flutter/material.dart';

class AppTheme {
  static const double _appBarElevation = 1;

  static const MaterialColor _defaultSwatch = Colors.amber;

  static CardTheme _cardTheme({
    Color borderColor = const Color(0xFFE0E0E0),
    Color color = Colors.white,
  }) {
    return CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(
          color: borderColor,
          width: 0.75,
        ),
      ),
      color: color,
      elevation: 0,
    );
  }

  static const TextTheme _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      fontSize: 18,
    ),
  );

  static ThemeData light(ColorScheme? colorscheme) {
    final scheme = colorscheme ??
        ColorScheme.fromSwatch(
          primarySwatch: _defaultSwatch,
        );

    return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        color: scheme.background,
        elevation: _appBarElevation,
      ),
      cardTheme: _cardTheme(
        borderColor: scheme.onBackground.withOpacity(0.12),
        color: scheme.background,
      ),
      textTheme: _textTheme,
      colorScheme: scheme,
    );
  }

  static ThemeData dark(ColorScheme? colorscheme) {
    final scheme = colorscheme ??
        ColorScheme.fromSwatch(
          primarySwatch: _defaultSwatch,
          brightness: Brightness.dark,
        );

    return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        color: scheme.background,
        elevation: _appBarElevation,
      ),
      cardTheme: _cardTheme(
        borderColor: scheme.onBackground.withOpacity(0.12),
        color: scheme.background,
      ),
      textTheme: _textTheme,
      colorScheme: scheme,
    );
  }
}
