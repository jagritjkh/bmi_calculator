import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bmi_calculator/generated/l10n.dart';
import 'package:bmi_calculator/local_data_layer/local_data_layer.dart';
import 'package:bmi_calculator/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/input_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? isDark = await LocalDataLayer().getTheme();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(BMICalculator(isDark!));
}

class BMICalculator extends StatelessWidget {
  final bool isDark;

  BMICalculator(this.isDark);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      builder: (context, myTheme) {
        return MaterialApp(
          theme: myTheme,
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
  }
}
