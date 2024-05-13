import 'package:flutter/material.dart';

class SizeConfig extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const SizeConfig({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });


  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1008) {
      return desktop;
    }
    else if (size.width >= 600 && tablet != null) {
      return tablet!;
    }
    else {
      return mobile;
    }
  }
}



double getProportionateScreenHeight(double inputHeight,BuildContext context ) {
  double screenHeight = MediaQuery.of(context).size.height;
  return (inputHeight / 812.0) * screenHeight;
}


double getProportionateScreenWidth(double inputWidth,BuildContext context) {
  double screenWidth =MediaQuery.of(context).size.width;
  return (inputWidth / 375.0) * screenWidth;
}


double getShortSize(double inputSide, BuildContext context) {
  double screenShortSide = MediaQuery.of(context).size.shortestSide;
  return (inputSide / 375.0) * screenShortSide;
}