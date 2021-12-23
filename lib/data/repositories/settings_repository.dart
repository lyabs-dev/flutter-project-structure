import 'package:flutter_structure/data/models/settings_item.dart';
import 'package:flutter_structure/data/providers/settings_provider.dart';
import 'package:flutter_structure/utils/constants.dart';

class SettingsRepository {

  SettingsProvider provider = SettingsProvider();

  Future<SettingsItem> getSettings() async {
    Map<String, dynamic> map = await provider.getSettings();
    SettingsItem settings = SettingsItem.fromMap(map);
    return settings;
  }

  Future setSettings(SettingsItem settingsItem) async {
    await provider.setSettings(settingsItem);
  }

}