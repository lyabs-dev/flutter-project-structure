import 'package:structure/data/models/settings_item.dart';
import 'package:structure/logic/states/default_state.dart';

class SettingsState extends DefaultState {

    SettingsItem settings;

    SettingsState({required this.settings, super.isLoading = true,});

    @override
    SettingsState copy() {
      SettingsState copy = SettingsState(settings: settings, isLoading: isLoading,);

      return copy;
    }
}