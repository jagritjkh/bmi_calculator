import 'package:flutter/material.dart';

Color kBottomContainerColor = Color(0xFF111328);

TextStyle kLabelTextStyle =
    TextStyle(fontSize: 18.0, color: kBottomContainerColor);

TextStyle kFontTextStyle = TextStyle(
  fontSize: 36.0,
  fontWeight: FontWeight.w900,
  color: kBottomContainerColor,
);

TextStyle kResultTextStyle = TextStyle(
  fontSize: 24.0,
  color: Colors.green.shade500,
);

LinearGradient kLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.grey.shade400,
      Colors.grey.shade300,
      Colors.grey.shade200,
      Colors.grey.shade100,
    ],
    stops: [
      0.05,
      0.3,
      0.7,
      0.9,
    ]);

var kBoxShadow = [
  BoxShadow(
    color: Colors.grey.shade600,
    offset: Offset(5.0, 5.0),
    blurRadius: 15.0,
    spreadRadius: 1.0,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(-5.0, -5.0),
    blurRadius: 15.0,
    spreadRadius: 1.0,
  ),
];
