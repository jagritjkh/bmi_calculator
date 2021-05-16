import 'package:bmi_calculator/theme/style.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static final String appName = 'BMI, BMR & Ideal Weight CALCULATOR';
  static final String packageName = 'co.dartartau.bmicalculator';
  static final String languageDefault = "en";
  static final ThemeData defaultTheme = AppTheme.lightTheme;
  static final Map<String, String> languagesSupported = {
    'en': "English",
    'ar': "عربى",
    'pt': "Portugal",
    'fr': "Français",
    'id': "Bahasa Indonesia",
    'es': "Español",
  };
}
