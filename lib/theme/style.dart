import 'package:flutter/material.dart';

import 'constants.dart';

final Color backgroundColor = Colors.grey.shade300;

final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: kBottomContainerColor),
    ));
