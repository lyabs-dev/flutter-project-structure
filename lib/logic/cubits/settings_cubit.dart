import 'package:structure/data/repositories/settings_repository.dart';
import 'package:structure/logic/cubits/default_cubit.dart';
import 'package:structure/logic/states/settings_state.dart';

class SettingsCubit extends DefaultCubit<SettingsState> {
  SettingsRepository repository = SettingsRepository();

  SettingsCubit(super.initialState);

  @override
  void initData() {}

  void update() {
    repository.setSettings(state.settings);
    emit(state.copy());
  }

  void toggleDarkMode() async {
    state.settings.isDarkMode = !state.settings.isDarkMode;
    update();
  }

  void setLanguage(String lang) async {
    state.settings.langCode = lang;
    update();
  }
}
