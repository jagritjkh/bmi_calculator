import 'package:flutter/material.dart';

final Color lightColor = Colors.grey.shade300;
final Color darkColor = Color(0xFF111328);
final Color grey600 = Colors.grey.shade600;
final Color grey400 = Colors.grey.shade400;
final Color grey300 = Colors.grey.shade300;
final Color grey200 = Colors.grey.shade200;
final Color grey100 = Colors.grey.shade100;

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightColor,
    primaryColor: Colors.white,
    backgroundColor: darkColor,
    cardColor: grey600,
    accentColor: grey400,
    disabledColor: grey300,
    dividerColor: grey200,
    hintColor: grey100,

    //appbar theme
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: darkColor),
    ),

    //text theme
    textTheme: TextTheme(
      button: TextStyle(color: lightColor, fontSize: 20),
      bodyText1: TextStyle(
        color: darkColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),

    //slider theme
    sliderTheme: SliderThemeData(
      activeTrackColor: darkColor,
      inactiveTrackColor: Colors.red,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      thumbColor: darkColor,
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
      overlayColor: darkColor.withOpacity(0.3),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkColor,
    backgroundColor: lightColor,

    //app bar theme
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: lightColor),
      titleTextStyle: TextStyle(fontSize: 20, color: lightColor),
    ),

    //text theme
    textTheme: TextTheme(
      button: TextStyle(color: darkColor, fontSize: 20),
    ),

    //slider theme
    sliderTheme: SliderThemeData(
      activeTrackColor: lightColor,
      inactiveTrackColor: Colors.red,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      thumbColor: lightColor,
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
      overlayColor: lightColor.withOpacity(0.3),
    ),
  );
}
