import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/logic/cubits/app_cubit.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';
import 'package:flutter_structure/presentation/components/app_button.dart';
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
            const SizedBox(height: 16),
            AppButton(
              text: 'Set Theme',
              onPressed: () {
                context.read<SettingsCubit>().toggleDarkMode();
              },
              context: context,
            ),
            const SizedBox(height: 16),
            AppButton(
              text: 'Show Confirm Dialog',
              onPressed: () {
                AppDialog.showConfirmDialog(context, 'Do you like this app?')
                    .then((value) => debugPrint('========> User\'s answer: $value'));
              },
              context: context
            ),
          ],
        ),
      ),
    );
  }

}