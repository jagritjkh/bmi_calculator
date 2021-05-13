import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDecoration {
  static BoxDecoration decoration(
      ThemeData theme, {BoxBorder? border, Gradient? gradient, double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 18.0),
      border: border,
      boxShadow: [
        BoxShadow(
          color: theme.cardColor,
          offset: Offset(5.0, 5.0),
          blurRadius: 15.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: theme.primaryColor,
          offset: Offset(-5.0, -5.0),
          blurRadius: 15.0,
          spreadRadius: 1.0,
        ),
      ],
      gradient: gradient ??
          LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.accentColor,
                theme.disabledColor,
                theme.dividerColor,
                theme.hintColor,
              ],
              stops: [
                0.05,
                0.3,
                0.7,
                0.9,
              ]),
    );
  }
}
