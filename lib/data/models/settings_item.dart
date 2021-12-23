import 'package:flutter_structure/utils/constants.dart';

class SettingsItem {

  String langCode;
  bool isDarkMode;

  SettingsItem({this.langCode: LANG_CODE, this.isDarkMode: false});

  Map<String, dynamic> toMap() {
    return {
      SETTING_LANGUAGE: langCode,
      SETTING_IS_DARK_MODE: isDarkMode,
    };
  }

  static SettingsItem fromMap(Map<String, dynamic> map) {
    return SettingsItem(
      isDarkMode: map[SETTING_IS_DARK_MODE],
      langCode: map[SETTING_LANGUAGE],
    );
  }

}