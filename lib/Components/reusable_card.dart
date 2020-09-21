import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final Function onPress;
  final LinearGradient gradient;
  final Border border;

  ReusableCard({this.cardChild, this.onPress, this.gradient, this.border});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          border: border,
          boxShadow: kBoxShadow,
          gradient: gradient ?? kLinearGradient,
        ),
        child: cardChild,
        margin: EdgeInsets.all(10.0),
      ),
    );
  }
}
