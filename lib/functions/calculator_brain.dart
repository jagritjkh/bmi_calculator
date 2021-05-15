import 'dart:math';

import 'package:bmi_calculator/screens/input_page.dart';

class CalculatorBrain {
  final Gender? gender;
  final int? height;
  final int? weight;
  final int? age;

  CalculatorBrain({this.gender, this.height, this.weight, this.age});

  late double _bmi;

  String calculateBmi() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  int? _bmrMen;
  int? _bmrWomen;

  String calculateBmrMen() {
    _bmrMen = (66.47 + (13.75 * weight!) + (5.003 * height!) - (6.755 * age!))
        .toInt();
    return _bmrMen.toString();
  }

  String calculateBmrWomen() {
    _bmrWomen =
        (66.47 + (6.24 * weight!) + (12.7 * height!) - (6.755 * age!)).toInt();
    return _bmrWomen.toString();
  }

  int? _ibwMen;
  int? _ibwWomen;

  String calculateIbwMen() {
    _ibwMen = (50.0 + 0.9 * (height! - 152.4)).toInt();
    return _ibwMen.toString();
  }

  String calculateIbwWomen() {
    _ibwWomen = (45.5 + 0.9 * (height! - 152.4)).toInt();
    return _ibwWomen.toString();
  }

  String getBmiResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return 'Your body weight is higher than normal.' +
          '\n' +
          'Exercise more!';
    else if (_bmi > 18)
      return 'You have a normal body weight.' + '\n' + 'Great going!';
    else
      return 'You are underweight.' + '\n' + 'Have some more food!';
  }
}
