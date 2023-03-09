import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void setThemeMode(ThemeMode themeMode) {
    emit(themeMode);
  }

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    final themeMode = json['themeMode'] as String?;
    switch (themeMode) {
      case 'system':
        return ThemeMode.system;
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    switch (state) {
      case ThemeMode.system:
        return {'themeMode': 'system'};
      case ThemeMode.light:
        return {'themeMode': 'light'};
      case ThemeMode.dark:
        return {'themeMode': 'dark'};
    }
  }
}
