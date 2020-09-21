import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatefulWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({this.icon, this.onPressed});

  @override
  _RoundIconButtonState createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  bool _buttonPressed = false;

  bool _loopActive = false;

  void _increaseCounterWhilePressed() async {
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      setState(() {
        widget.onPressed();
      });

      await Future.delayed(Duration(milliseconds: 150));
    }

    _loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        _buttonPressed = true;
        _increaseCounterWhilePressed();
      },
      onPointerUp: (details) {
        _buttonPressed = false;
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: kBottomContainerColor,
            boxShadow: kBoxShadow,
            gradient: kLinearGradient),
        child: RawMaterialButton(
          child: Icon(
            widget.icon,
            color: kBottomContainerColor,
          ),
          constraints: BoxConstraints.tightFor(
            width: 50.0,
            height: 50.0,
          ),
        ),
      ),
    );
  }
}
