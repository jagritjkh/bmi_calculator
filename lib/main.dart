import 'package:bmi_calculator/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/input_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: InputPage(),
    );
  }
}
