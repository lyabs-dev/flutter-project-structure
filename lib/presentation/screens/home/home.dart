import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}): super(key: key);

  @override
  HomePageState createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle)
      ),
      body: TextButton(
          onPressed: () {
            context.read<SettingsCubit>().toggleDarkMode();
          },
          child: const Text('Set Theme')
      ),
    );
  }

}