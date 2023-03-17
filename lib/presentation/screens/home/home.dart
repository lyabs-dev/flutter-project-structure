import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/logic/cubits/app_cubit.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';
import 'package:flutter_structure/presentation/components/app_dialog.dart';
import 'package:flutter_structure/presentation/components/page_container.dart';

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
    return PageContainer(
      child: Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle)
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  context.read<SettingsCubit>().toggleDarkMode();
                },
                child: const Text('Set Theme')
            ),
            TextButton(
              onPressed: () {
                AppDialog.showConfirmDialog(context, 'Do you like this app?')
                    .then((value) => debugPrint('========> User\'s answer: $value'));
              },
              child: const Text('Show Confirm Dialog'),
            )
          ],
        ),
      ),
    );
  }

}