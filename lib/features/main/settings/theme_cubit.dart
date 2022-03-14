import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeKey = 'THEME';

class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferences prefs;

  ThemeCubit({required this.prefs}) : super(ThemeMode.system);

  ThemeMode themeModeFromString(String theme) {
    return ThemeMode.values.firstWhere(
      (e) => e.toString() == theme,
      orElse: () => ThemeMode.system,
    );
  }

  void setTheme(ThemeMode theme) {
    prefs.setString(kThemeKey, theme.toString());
    emit(theme);
  }

  void getTheme() {
    final prefTheme = prefs.getString(kThemeKey);
    final theme =
        prefTheme != null ? themeModeFromString(prefTheme) : ThemeMode.system;
    emit(theme);
  }
}
