import 'package:flutter/material.dart';
import 'package:structure/utils/constants.dart';

final darkTheme = ThemeData(
  primarySwatch: SwatchColor.color,
  primaryColor: colorPrimary,
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    primary: colorPrimary,
    secondary: colorSecondary,
  ),
);

final lightTheme = ThemeData(
  primarySwatch: SwatchColor.color,
  primaryColor: colorPrimary,
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: colorPrimary,
    secondary: colorSecondary,
  ),
);

class SwatchColor {
  static const MaterialColor color = MaterialColor(
    colorHex,
    <int, Color>{
      50: colorPrimary,//10%
      100: colorPrimary,//20%
      200: colorPrimary,//30%
      300: colorPrimary,//40%
      400: colorPrimary,//50%
      500: colorPrimary,//60%
      600: colorPrimary,//70%
      700: colorPrimary,//80%
      800: colorPrimary,//90%
      900: colorPrimary,//100%
    },
  );
}