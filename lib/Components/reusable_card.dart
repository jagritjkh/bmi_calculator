import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ReusableCard extends StatefulWidget {
  final Widget cardChild;
  final Function onPress;
  final LinearGradient gradient;
  final Border border;
  final double padding;

  ReusableCard(
      {this.cardChild, this.onPress, this.gradient, this.border, this.padding});

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Transform.scale(
        scale: animation.value,
        child: Container(
          padding: EdgeInsets.all(widget.padding ?? 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            border: widget.border,
            boxShadow: kBoxShadow,
            gradient: widget.gradient ?? kLinearGradient,
          ),
          child: widget.cardChild,
          margin: EdgeInsets.all(widget.padding ?? 12.0),
        ),
      ),
    );
  }
}
