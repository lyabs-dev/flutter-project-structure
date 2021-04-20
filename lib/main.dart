import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'services/localizations.dart';
import 'screens/home/home.dart';
import 'services/utils.dart' as utils;
import 'styles/styles.dart';

void main() {
  String langCode = utils.LANG_CODE;

  runApp(MaterialApp(
    localizationsDelegates: [
      MyLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    onGenerateTitle: (BuildContext context) =>
    MyLocalizations.of(context).localization['app_title'],
    locale: Locale(langCode),
    supportedLocales: [Locale('en')],
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

  String langCode = utils.LANG_CODE;

  @override
  void initState() {
    super.initState();
  }

  Future initApp() async {

  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire:
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
