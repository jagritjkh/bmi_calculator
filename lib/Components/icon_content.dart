import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContent({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(bottom: 12.0),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Icon(
                icon,
                color: kBottomContainerColor,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(4.0),
          margin: EdgeInsets.only(bottom: 8.0),
          alignment: Alignment.center,
//          color: kBottomContainerColor,
          child: Text(
            text,
            style: kLabelTextStyle,
          ),
        ),
      ],
    );
  }
}
