import 'package:bmi_calculator/app_config/app_config.dart';
import 'package:bmi_calculator/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_data_layer.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppConfig.defaultTheme);

  void selectTheme(ThemeData theme) {
    emit(theme);
  }

  void getTheme() async {
    ThemeData currTheme = await LocalDataLayer().getTheme();
    selectTheme(currTheme);
  }

  void setTheme(bool isDark) async {
    ThemeData theme = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    await LocalDataLayer().setTheme(isDark);
    selectTheme(theme);
  }
}
