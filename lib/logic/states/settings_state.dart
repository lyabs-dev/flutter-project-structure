import 'package:flutter_structure/data/models/settings_item.dart';

class SettingsState {

  SettingsItem settings;

  SettingsState(this.settings,);

  SettingsState copy() {
    SettingsState copy = SettingsState(settings);

    return copy;
  }

}