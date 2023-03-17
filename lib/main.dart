import 'package:flutter/material.dart';
import 'package:flutter_structure/data/models/settings_item.dart';
import 'package:flutter_structure/data/repositories/settings_repository.dart';
import 'package:flutter_structure/logic/cubits/app_cubit.dart';
import 'package:flutter_structure/logic/cubits/settings_cubit.dart';
import 'package:flutter_structure/logic/states/app_state.dart';
import 'package:flutter_structure/logic/states/settings_state.dart';
import 'package:flutter_structure/presentation/components/page_container.dart';
import 'package:flutter_structure/presentation/router/app_router.dart';
import 'package:flutter_structure/presentation/screens/error_page/error_page.dart';
import 'package:flutter_structure/presentation/screens/home/home.dart';
import 'package:flutter_structure/presentation/styles/styles.dart';
import 'package:flutter_structure/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/utils/enums.dart';
import 'package:flutter_structure/utils/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SettingsItem settings = await SettingsRepository().getSettings();
  runApp(MyApp(appRouter: AppRouter(), settings: settings,));
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;
  final SettingsItem settings;

  const MyApp({Key? key, required this.appRouter, required this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(SettingsState(settings))
        ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(AppState())
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {

          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
            locale: Locale(state.settings.langCode),
            supportedLocales: supportedLanguages.toList().map((lang) => Locale(lang)),
            debugShowCheckedModeBanner: false,
            theme: (state.settings.isDarkMode)? darkTheme: lightTheme,
            onGenerateRoute: appRouter.onGenerateRoute,
            home: PageContainer(
              child: BlocBuilder<AppCubit, AppState>(
                builder: (appContext, appState) {

                  SizeConfig().init(appContext);

                  if (appState.loadingState == CustomState.loading) {
                    return const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  ///An Error page
                  ///return ErrorPage(title: 'Error', description: 'An erroer r An erroer rAn erroer rAn erroer rAn erroer rAn erroer rAn erroer rAn erroer r', onTry: () {});

                  return const HomePage();
                },
              ),
            ),
          );
        },
      ),
    );
  }

}
