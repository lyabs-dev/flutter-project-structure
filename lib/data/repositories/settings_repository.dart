import 'package:structure/data/models/settings_item.dart';
import 'package:structure/data/providers/settings_provider.dart';

class SettingsRepository {

  SettingsProvider provider = SettingsProvider();

  Future<SettingsItem> getSettings() async {
    Map<String, dynamic> map = await provider.getSettings();
    SettingsItem settings = SettingsItem.fromMap(map);
    return settings;
  }

  Future<bool> setSettings(SettingsItem settingsItem) async {
    return await provider.setSettings(settingsItem);
  }

}