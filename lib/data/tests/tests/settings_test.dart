import 'package:lyabs_dev/utils/my_material.dart';
import 'package:test/test.dart' as test;

class SettingsTest {

  static SettingsItem settingsItem = SettingsItem();
  static SettingsRepository repository = SettingsRepository();

  static run() {
    debugPrint('=========Start Settings Test=========');

    _get();
    _set();
  }

  static _get() {
    test.test('Get settings', () async {
      settingsItem = await repository.getSettings();
      test.expect(settingsItem.toMap(), test.isNotEmpty);
    });
  }

  static _set() {
    test.test('Set settings', () async {
      settingsItem.isDarkMode = false;
      bool res = await repository.setSettings(settingsItem);
      test.expect(res, true);
    });
  }

}