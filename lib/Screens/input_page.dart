import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Screens/results_page.dart';
import 'package:bmi_calculator/Components/bottom_bar.dart';
import 'package:bmi_calculator/Components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  maleCard,
  femaleCard,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'BMI, BMR & Ideal Weight CALCULATOR',
                  style: kFontTextStyle.copyWith(fontSize: 14.0),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.maleCard;
                          });
                        },
                        border: selectedGender == Gender.maleCard
                            ? Border.all(color: kBottomContainerColor)
                            : null,
                        cardChild: IconContent(
                          text: 'MALE',
                          icon: FontAwesomeIcons.male,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(
                            () {
                              selectedGender = Gender.femaleCard;
                            },
                          );
                        },
                        border: selectedGender == Gender.femaleCard
                            ? Border.all(color: kBottomContainerColor)
                            : null,
                        cardChild: IconContent(
                          text: 'FEMALE',
                          icon: FontAwesomeIcons.female,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kFontTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(
                                () {
                                  (height == 120) ? height = 120 : height--;
                                },
                              );
                            },
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: kBottomContainerColor,
                              inactiveTrackColor: Colors.red,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0),
                              thumbColor: kBottomContainerColor,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20.0),
                              overlayColor:
                                  kBottomContainerColor.withOpacity(0.3),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(
                                  () {
                                    height = newValue.round();
                                  },
                                );
                              },
                            ),
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                (height == 220) ? height = 220 : height++;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: kLabelTextStyle),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: kFontTextStyle,
                              ),
                              Text(
                                'kg',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight == 20 ? weight = 20 : weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      (weight == 400) ? weight = 400 : weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE', style: kLabelTextStyle),
                          Text(
                            age.toString(),
                            style: kFontTextStyle,
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age == 10 ? age = 10 : age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age == 135 ? age = 135 : age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              BottomBar(
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(
                      gender: selectedGender,
                      height: height,
                      weight: weight,
                      age: age);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultsPage(
                          finalBmi: calc.calculateBmi(),
                          result: calc.getBmiResult(),
                          interpretation: calc.getInterpretation(),
                          finalBmr: selectedGender == Gender.maleCard
                              ? calc.calculateBmrMen()
                              : calc.calculateBmrWomen(),
                          finalIbw: selectedGender == Gender.maleCard
                              ? calc.calculateIbwMen()
                              : calc.calculateIbwWomen(),
                        );
                      },
                    ),
                  );
                },
                text: 'CALCULATE',
              )
            ],
          ),
        ),
      ),
    );
  }
}
