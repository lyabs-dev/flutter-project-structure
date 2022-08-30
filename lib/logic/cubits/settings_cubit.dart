import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/data/repositories/settings_repository.dart';
import 'package:flutter_structure/logic/states/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {

  SettingsRepository repository = SettingsRepository();

  SettingsCubit(SettingsState initialState) : super(initialState);

  update() {
    repository.setSettings(state.settings);
    emit(state.copy());
  }

  toggleDarkMode() async {
    state.settings.isDarkMode = !state.settings.isDarkMode;
    update();
  }

  setLanguage(String lang) async {
    state.settings.langCode = lang;
    update();
  }

}