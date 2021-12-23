import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_structure/presentation/router/app_router.dart';
import 'package:flutter_structure/presentation/screens/home/home.dart';
import 'package:flutter_structure/presentation/styles/styles.dart';
import 'package:flutter_structure/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
    locale: Locale(LANG_CODE),
    supportedLocales: SUPPORTED_LANGUAGES.toList().map((lang) => Locale(lang)),
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    home: MyApp(appRouter: AppRouter(),),
  ));
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter,}) : super(key: key);

  Future initApp() async {

  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: initApp(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.done) {
          return HomePage();
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
