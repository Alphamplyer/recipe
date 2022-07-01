
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/const.dart';

class CustomTheme {
  static const kInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder()
  );

  static final elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(20.0))
    ),
  );

  static final outlinedButtonThemeData = OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(20.0))
    ),
  );

  static onCardInputDecorationTheme(BuildContext context) => InputDecoration(
    fillColor: Theme.of(context).canvasColor,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kRadius),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1,
      ),
    ),
  );

  static onCardInputDecorationThemeWithoutCounterText(BuildContext context) => InputDecoration(
    fillColor: Theme.of(context).canvasColor,
    filled: true,
    errorStyle: TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kRadius),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1,
      ),
    ),
    counterText: '', 
  );
}