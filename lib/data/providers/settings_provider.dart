import 'dart:convert';
import 'package:structure/utils/my_material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider {

  Future<Map<String, dynamic>> getSettings() async {

    Map<String, dynamic> result = SettingsItem().toMap();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? settingsString = prefs.getString(prefSettings);

    if (settingsString != null) {
      try {
        result = json.decode(settingsString);
      }
      catch (e) {
        //error message
      }
    }

    return result;
  }

  Future<bool> setSettings(SettingsItem settings) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(prefSettings, json.encode(settings.toMap()));
  }

}