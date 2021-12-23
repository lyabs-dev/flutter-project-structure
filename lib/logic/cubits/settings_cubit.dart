import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/data/models/settings_item.dart';
import 'package:flutter_structure/data/repositories/settings_repository.dart';
import 'package:flutter_structure/logic/states/settings_state.dart';
import 'package:flutter_structure/utils/enums.dart';

class SettingsCubit extends Cubit<SettingsState> {

  SettingsCubit(SettingsState initialState) : super(initialState);

  getSettings() async {
    SettingsItem settings = await SettingsRepository().getSettings();
    emit(SettingsState(settings,));
  }

  setSettings(SettingsItem settingsItem) async {
    await SettingsRepository().setSettings(settingsItem);
    emit(SettingsState(settingsItem,));
  }

}