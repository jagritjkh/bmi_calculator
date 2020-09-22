import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Function onTap;
  final String text;

  BottomBar({@required this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20.0, color: kBottomContainerColor),
          ),
        ),
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.symmetric(vertical: 18.0),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: kBoxShadow,
          gradient: kLinearGradient,
        ),
      ),
    );
  }
}
