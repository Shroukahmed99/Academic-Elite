import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/config/theme/theme_cubit/theme_cubit.dart';
import 'package:academic_elite/core/cache/shared_pref/shared_pref.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/features/language/presentation/manager/language/language_cubit.dart';
import 'package:academic_elite/features/language/presentation/manager/language/language_state.dart';
import 'package:academic_elite/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:academic_elite/core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  await SharedPref.preferences.instantiatePreferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, languageState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,

                locale: languageState.locale,

                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                supportedLocales: AppLocalizations.supportedLocales,

                theme: themeState.themeData,

                initialRoute: AppRoutes.splash,

                onGenerateRoute: AppRoutes.onGenerateRoute,

                builder: (context, child) {
                  AppSizes.init(context);

                  final locale = Localizations.localeOf(context);

                  return Directionality(
                    textDirection: locale.languageCode == "ar"
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: child!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
