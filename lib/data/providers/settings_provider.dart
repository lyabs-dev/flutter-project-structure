import 'dart:convert';

import 'package:flutter_structure/data/models/settings_item.dart';
import 'package:flutter_structure/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider {

  Future<Map<String, dynamic>> getSettings() async {

    Map<String, dynamic> result = SettingsItem().toMap();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? settingsString = prefs.getString(PREF_SETTINGS);

    if (settingsString != null) {
      try {
        result = json.decode(settingsString);
      }
      catch (e) {

      }
    }

    return result;
  }

  Future setSettings(SettingsItem settings) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PREF_SETTINGS, json.encode(settings.toMap()));
  }

}