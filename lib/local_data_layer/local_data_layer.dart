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

  _initPref() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setTheme(bool value) async {
    await _initPref();
    return _prefs!.setBool(isDark, value);
  }

  Future<bool?> getTheme() async {
    await _initPref();
    return _prefs!.containsKey(isDark) ? _prefs!.getBool(isDark) : false;
  }
}
