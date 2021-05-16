import 'package:bmi_calculator/app_config/app_config.dart';
import 'package:bmi_calculator/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataLayer {
  LocalDataLayer._privateConstructor() {
    _initPref();
  }

  static final LocalDataLayer _instance = LocalDataLayer._privateConstructor();

  factory LocalDataLayer() {
    return _instance;
  }

  SharedPreferences? _prefs;
  static const String isDark = 'isDark';
  static const String locale = 'locale';

  _initPref() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setTheme(bool value) async {
    await _initPref();
    return _prefs!.setBool(isDark, value);
  }

  Future<ThemeData> getTheme() async {
    await _initPref();
    bool? isDarkTheme =
        _prefs!.containsKey(isDark) ? _prefs!.getBool(isDark) : false;
    if (isDarkTheme!) {
      return AppTheme.darkTheme;
    } else {
      return AppTheme.lightTheme;
    }
  }

  Future<String> getCurrentLanguage() async {
    await _initPref();
    return _prefs!.containsKey(locale)
        ? _prefs!.getString(locale)!
        : AppConfig.languageDefault;
  }

  Future<bool> setCurrentLanguage(String langCode) async {
    await _initPref();
    return _prefs!.setString(locale, langCode);
  }
}
