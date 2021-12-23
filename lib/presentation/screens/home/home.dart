import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/data/models/settings_item.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle)
      ),
      body: Container(
        child: TextButton(
          onPressed: () {
            SettingsItem settingsItem = context.read<SettingsCubit>().state.settings;
            settingsItem.isDarkMode = !settingsItem.isDarkMode;
            context.read<SettingsCubit>().setSettings(settingsItem);
          },
          child: Text('Set Theme')
        ),
      ),
    );
  }

}