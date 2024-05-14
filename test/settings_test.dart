import 'package:structure/utils/my_material.dart';
import 'package:test/test.dart' as test;
import 'package:shared_preferences/shared_preferences.dart';

SettingsItem settingsItem = SettingsItem();
SettingsRepository repository = SettingsRepository();

void main() {
  SharedPreferences.setMockInitialValues({});

  get();
  set();
}

get() {
  test.test('Get settings', () async {
    settingsItem = await repository.getSettings();
    test.expect(settingsItem.toMap(), test.isNotEmpty);
  });
}

set() {
  test.test('Set settings', () async {
    settingsItem.isDarkMode = false;
    bool res = await repository.setSettings(settingsItem);
    test.expect(res, true);
  });
}