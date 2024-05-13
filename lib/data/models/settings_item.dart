import 'package:structure/utils/constants.dart';

class SettingsItem {

  String langCode;
  bool isDarkMode;

  SettingsItem({this.langCode = langCodeDefault, this.isDarkMode = false});

  Map<String, dynamic> toMap() {
    return {
      settingLanguage: langCode,
      settingIsDarkMode: isDarkMode,
    };
  }

  static SettingsItem fromMap(Map<String, dynamic> map) {
    return SettingsItem(
      isDarkMode: map[settingIsDarkMode],
      langCode: map[settingLanguage],
    );
  }

}