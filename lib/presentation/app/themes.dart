import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light(ColorScheme? colorscheme) {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      colorScheme: colorscheme ??
          ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
    );
  }

  static ThemeData dark(ColorScheme? colorscheme) {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      colorScheme: colorscheme ??
          ColorScheme.fromSwatch(
            brightness: Brightness.dark,
            accentColor: const Color(0xFF13B9FF),
          ),
    );
  }
}
