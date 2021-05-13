import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:bmi_calculator/components/custom_box_decoration.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  final Widget? cardChild;
  final Function? onPress;
  final LinearGradient? gradient;
  final Border? border;
  final double? padding;

  ReusableCard(
      {this.cardChild, this.onPress, this.gradient, this.border, this.padding});

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress as void Function()?,
      child: FadedScaleAnimation(
        Container(
          padding: EdgeInsets.all(widget.padding ?? 16.0),
          decoration: CustomDecoration.decoration(
            Theme.of(context),
            border: widget.border,
            gradient: widget.gradient,
            radius: 18,
          ),
          child: widget.cardChild,
          margin: EdgeInsets.all(widget.padding ?? 12.0),
        ),
        durationInMilliseconds: 800,
      ),
    );
  }
}
