import 'package:flutter/material.dart';
import 'package:flutter_structure/presentation/router/no_animation_route.dart';
import 'package:flutter_structure/presentation/screens/home/home.dart';

import '../../utils/constants.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {

    Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
    Widget? page;

    switch (settings.name) {
      case PAGE_HOME:
        page = HomePage();
        break;
      default:
    }

    if (page != null) {

      if (arguments != null && arguments[ARGUMENT_IS_NO_ANIMATION]) {
        return NoAnimationMaterialPageRoute(builder: (_) => page!);
      }

      return MaterialPageRoute(builder: (_) => page!);
    }

    return null;
  }
}