import 'dart:async' show Future;
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'utils.dart' show languages;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class MyLocalizations {
  MyLocalizations(this.locale,this.map);

  final Locale locale;
  Map map;
  static Map instanceLocalization;

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  Map get localization {
    return map;
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {

  MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) async {
    String value = await rootBundle.loadString(
        'assets/i18n/' + locale.languageCode + '.json');
    Map map = json.decode(value);
    MyLocalizations.instanceLocalization = map;
    return SynchronousFuture<MyLocalizations>(
        MyLocalizations(locale,map));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
