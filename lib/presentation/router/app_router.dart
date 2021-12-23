import 'package:flutter/material.dart';
import 'package:flutter_structure/presentation/screens/home/home.dart';

import '../../utils/constants.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PAGE_HOME:
        return MaterialPageRoute(
          builder: (_) => HomePage()
        );
      default:
        return null;
    }
  }
}