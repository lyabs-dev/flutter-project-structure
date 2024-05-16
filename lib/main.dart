import 'package:structure/logic/cubits/app_cubit.dart';
import 'package:structure/logic/states/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:structure/presentation/pages/home_page/home_page.dart';
import 'package:structure/utils/my_material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SettingsItem settings = await SettingsRepository().getSettings();
  runApp(MyApp(appRouter: AppRouter(), settings: settings,));
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;
  final SettingsItem settings;

  const MyApp({super.key, required this.appRouter, required this.settings});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(411.4, 867.4),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return MultiBlocProvider(
          providers: [
            BlocProvider<SettingsCubit>(
                create: (context) => SettingsCubit(SettingsState(settings: settings))
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
                home: PageContainerWidget(
                  child: BlocBuilder<AppCubit, AppState>(
                    builder: (appContext, appState) {

                      if (appState.isLoading) {
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
    );

  }

}
