import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:structure/logic/cubits/app_cubit.dart';
import 'package:structure/presentation/dialogs/custom_dialog.dart';
import '../../../utils/my_material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageContainerWidget(
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                AppButtonWidget(
                  text: 'Set Theme',
                  onPressed: () {
                    context.read<SettingsCubit>().toggleDarkMode();
                  },
                  context: context,
                ),
                const SizedBox(height: 16),
                AppButtonWidget(
                    text: 'Show Confirm Dialog',
                    icon: Icons.question_answer,
                    onPressed: () {
                      AppDialog.showConfirmDialog(context, 'Do you like this app?')
                          .then((value) => debugPrint('========> User\'s answer: $value'));
                    },
                    context: context),
                const SizedBox(height: 16),
                AppButtonWidget(
                    text: 'Show Dialog',
                    onPressed: () {
                      context.read<AppCubit>().testShowDialog();
                    },
                    context: context
                ),
                const SizedBox(height: 16),
                AppButtonWidget(
                    text: 'Show About Dialog',
                    onPressed: () {
                      AppDialog.showAboutAppDialog(context);
                    },
                    context: context
                ),
                const SizedBox(height: 16),
                AppButtonWidget(
                    text: 'Show custom dialog',
                    onPressed: () {
                      AppDialog(
                        title: 'Custom Dialog',
                        context: context,
                        buttonPositiveText: 'Reset',
                        buttonNegativeText: 'Cancel',
                        icon: Icons.lock,
                        customContent: const CustomDialog(),
                      ).show();
                    },
                    context: context
                ),
                const SizedBox(height: 16),
                Container(
                  width: 1.sw,
                  height: 0.8.sh,
                  color: colorPrimary.withOpacity(0.3),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
