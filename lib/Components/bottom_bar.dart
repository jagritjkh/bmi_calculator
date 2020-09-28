import 'package:bmi_calculator/Theme/constants.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Function onTap;
  final String text;
  final double width;

  BottomBar({@required this.onTap, @required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.symmetric(vertical: 18.0),
        height: 60,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: kBoxShadow,
          color: kBottomContainerColor,
          // gradient: kLinearGradient,
        ),
      ),
    );
  }
}
