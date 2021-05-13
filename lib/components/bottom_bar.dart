import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;

  BottomBar({required this.onTap, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.button,
          ),
        ),
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.symmetric(vertical: 18.0),
        height: 60,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).cardColor,
              offset: Offset(5.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Theme.of(context).primaryColor,
              offset: Offset(-5.0, -5.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
          color: Theme.of(context).backgroundColor,
          // gradient: kLinearGradient,
        ),
      ),
    );
  }
}
