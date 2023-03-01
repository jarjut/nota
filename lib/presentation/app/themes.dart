import 'package:flutter/material.dart';

// <====== Light Colors ======>
Color lightBackgroundColor = Colors.grey.shade50;
// <====== Dark Colors ======>
const Color darkBackgroundColor = Color(0xFF24232F);
const Color darkCardColor = Color(0xFF1E1D26);
const Color darkAppBarColor = Color(0xFF1B1A24);

class AppTheme {
  static const double _appBarElevation = 1;

  static const MaterialColor _defaultSwatch = Colors.amber;

  static CardTheme _cardTheme({
    Color borderColor = const Color(0xFFE0E0E0),
    Color color = Colors.white,
  }) {
    return CardTheme(
      clipBehavior: Clip.antiAlias,
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
      // useMaterial3: true,
      scaffoldBackgroundColor: lightBackgroundColor,
      appBarTheme: AppBarTheme(
        color: lightBackgroundColor,
        elevation: _appBarElevation,
      ),
      cardTheme: _cardTheme(
        borderColor: Colors.grey.shade400,
        color: lightBackgroundColor,
      ),
      textTheme: _textTheme,
      colorScheme: scheme,
    );
  }

  static ThemeData dark(ColorScheme? colorscheme) {
    final scheme = colorscheme ??
        ColorScheme.fromSwatch(
          primarySwatch: _defaultSwatch,
          accentColor: _defaultSwatch,
          brightness: Brightness.dark,
        );

    return ThemeData(
      // useMaterial3: true,
      scaffoldBackgroundColor: darkBackgroundColor,
      appBarTheme: const AppBarTheme(
        color: darkBackgroundColor,
        elevation: _appBarElevation,
      ),
      cardTheme: _cardTheme(
        borderColor: Colors.grey,
        color: darkBackgroundColor,
      ),
      canvasColor: darkAppBarColor,
      cardColor: darkCardColor,
      dialogBackgroundColor: darkCardColor,
      textTheme: _textTheme,
      colorScheme: scheme,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _defaultSwatch[800];
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _defaultSwatch[800];
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _defaultSwatch[800];
          }
          return null;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _defaultSwatch[800];
          }
          return null;
        }),
      ),
    );
  }
}
