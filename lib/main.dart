import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bmi_calculator/generated/l10n.dart';
import 'package:bmi_calculator/local_data_layer/language_cubit.dart';
import 'package:bmi_calculator/local_data_layer/theme_cubit.dart';
import 'package:bmi_calculator/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/input_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()..getTheme()),
        BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit()..getCurrentLanguage()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          bool isDark = theme == AppTheme.lightTheme ? false : true;
          return ThemeProvider(
            initTheme: theme,
            duration: Duration(milliseconds: 350),
            builder: (context, myTheme) {
              return BlocBuilder<LanguageCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp(
                    theme: myTheme,
                    locale: locale,
                    localizationsDelegates: [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    home: InputPage(isDark),
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
