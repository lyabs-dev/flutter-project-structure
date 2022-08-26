import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants.dart';

final darkTheme = ThemeData(
    primarySwatch: SwatchColor.color,
    primaryColor: COLOR_PRIMARY,
    brightness: Brightness.dark
);

final lightTheme = ThemeData(
    primarySwatch: SwatchColor.color,
    primaryColor: COLOR_PRIMARY,
    brightness: Brightness.light
);

class SwatchColor {
  static const MaterialColor color = const MaterialColor(
    COLOR_HEX,
    const <int, Color>{
      50: COLOR_PRIMARY,//10%
      100: COLOR_PRIMARY,//20%
      200: COLOR_PRIMARY,//30%
      300: COLOR_PRIMARY,//40%
      400: COLOR_PRIMARY,//50%
      500: COLOR_PRIMARY,//60%
      600: COLOR_PRIMARY,//70%
      700: COLOR_PRIMARY,//80%
      800: COLOR_PRIMARY,//90%
      900: COLOR_PRIMARY,//100%
    },
  );
}