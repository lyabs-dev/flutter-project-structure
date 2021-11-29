import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_structure/presentation/screens/home/home.dart';
import 'package:flutter_structure/presentation/styles/styles.dart';
import 'package:flutter_structure/utils/constants.dart';
import 'presentation/languages/localizations.dart';


void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      MyLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    onGenerateTitle: (BuildContext context) =>
    MyLocalizations.of(context)?.localization['app_title'],
    locale: Locale(LANG_CODE),
    supportedLocales: SUPPORTED_LANGUAGES.toList().map((lang) => Locale(lang)),
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

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
