
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme.dart';

class ThemeState {
  late ValueNotifier isDarkMode;

  ThemeState({bool enableDarkModeByDefault = false}) {
    isDarkMode = ValueNotifier(enableDarkModeByDefault);
  }

  ThemeMode get themeMode => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  final ThemeData lightTheme = ThemeData.light().copyWith(
    inputDecorationTheme: CustomTheme.kInputDecorationTheme,
    outlinedButtonTheme: CustomTheme.outlinedButtonThemeData,
    elevatedButtonTheme: CustomTheme.elevatedButtonThemeData,
  );

  final ThemeData darkTheme = ThemeData.dark().copyWith(
    inputDecorationTheme: CustomTheme.kInputDecorationTheme,
    outlinedButtonTheme: CustomTheme.outlinedButtonThemeData,
    elevatedButtonTheme: CustomTheme.elevatedButtonThemeData,
  );
}