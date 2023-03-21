import 'package:flutter/material.dart';
import 'package:lyabs_dev/utils/constants.dart';

final darkTheme = ThemeData(
    primarySwatch: SwatchColor.color,
    primaryColor: colorPrimary,
    brightness: Brightness.dark
);

final lightTheme = ThemeData(
    primarySwatch: SwatchColor.color,
    primaryColor: colorPrimary,
    brightness: Brightness.light
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