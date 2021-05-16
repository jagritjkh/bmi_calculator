import 'package:flutter/material.dart';

final Color darkColor = Colors.black;
final Color grey900 = Colors.grey.shade900;
final Color grey800 = Colors.grey.shade800;
final Color grey700 = Colors.grey.shade700;
final Color grey600 = Colors.grey.shade600;
final Color grey500 = Colors.grey.shade500;
final Color grey400 = Colors.grey.shade400;
final Color grey300 = Colors.grey.shade300;
final Color grey200 = Colors.grey.shade200;
final Color grey100 = Colors.grey.shade100;

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: grey300,
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
      button: TextStyle(color: grey300, fontSize: 20),
      bodyText1: TextStyle(
        color: darkColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodyText2: TextStyle(color: darkColor),
      headline4: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
      headline5: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
    ),

    //slider theme+
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
    scaffoldBackgroundColor: grey900,
    primaryColor: grey900,
    backgroundColor: grey300,
    cardColor: darkColor,
    accentColor: darkColor,
    disabledColor: Colors.black54,
    dividerColor: Colors.black45,
    hintColor: Colors.black38,

    //app bar theme
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: grey300),
      titleTextStyle: TextStyle(fontSize: 20, color: grey300),
    ),

    //text theme
    textTheme: TextTheme(
      button: TextStyle(color: darkColor, fontSize: 20),
      bodyText1: TextStyle(
        color: grey300,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodyText2: TextStyle(color: grey300),
      headline4: TextStyle(color: grey300, fontWeight: FontWeight.bold),
      headline5: TextStyle(color: grey300, fontWeight: FontWeight.bold),
    ),

    //slider theme
    sliderTheme: SliderThemeData(
      activeTrackColor: grey300,
      inactiveTrackColor: Colors.red,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      thumbColor: grey300,
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
      overlayColor: grey300.withOpacity(0.3),
    ),
  );
}
