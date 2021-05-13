import 'package:bmi_calculator/components/custom_box_decoration.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatefulWidget {
  final IconData? icon;
  final Function? onPressed;

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
        widget.onPressed!();
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
        decoration: CustomDecoration.decoration(Theme.of(context), radius: 30),
        padding: EdgeInsets.all(10.0),
        child: Icon(widget.icon, color: Theme.of(context).backgroundColor),
      ),
    );
  }
}
