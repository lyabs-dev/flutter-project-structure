import 'package:structure/presentation/pages/home_page/home_page.dart';
import 'package:structure/presentation/router/no_animation_route.dart';
import 'package:structure/utils/my_material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {

    Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
    Widget? page;

    switch (settings.name) {
      case pageHome:
        page = const HomePage();
        break;
      default:
    }

    if (page != null) {

      if (arguments != null && (arguments[argumentIsNOAnimation]?? false)) {
        return NoAnimationMaterialPageRoute(builder: (_) => page!);
      }

      return MaterialPageRoute(builder: (_) => page!);
    }

    return null;
  }
}