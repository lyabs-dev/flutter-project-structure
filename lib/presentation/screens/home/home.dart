import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyabs_dev/logic/cubits/app_cubit.dart';
import '../../../utils/my_material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
        body: SingleChildScrollView(
          child: Column(
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
                  context: context),
              const SizedBox(height: 16),
              AppButton(
                  text: 'Show Dialog',
                  onPressed: () {
                    context.read<AppCubit>().testShowDialog();
                  },
                  context: context
              ),
              const SizedBox(height: 16),
              Container(
                width: 1.sw,
                height: 0.8.sh,
                margin: EdgeInsets.all(8),
                color: colorPrimary.withOpacity(0.3),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
