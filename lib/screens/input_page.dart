import 'package:bmi_calculator/app_config/app_config.dart';
import 'package:bmi_calculator/components/bottom_bar.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/functions/calculator_brain.dart';
import 'package:bmi_calculator/functions/database_helper.dart';
import 'package:bmi_calculator/models/result.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/generated/l10n.dart';

enum Gender {
  maleCard,
  femaleCard,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConfig.appName,
          style: theme.textTheme.bodyText1,
        ),
        actions: [
          HistoryButton(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                          ? Border.all(color: theme.backgroundColor, width: 2)
                          : null,
                      cardChild: IconContent(
                        text: s.male,
                        icon: FontAwesomeIcons.male,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.femaleCard;
                        });
                      },
                      border: selectedGender == Gender.femaleCard
                          ? Border.all(color: theme.backgroundColor, width: 2)
                          : null,
                      cardChild: IconContent(
                        text: s.female,
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
                  Text(
                    s.height,
                    style: theme.textTheme.bodyText1,
                  ),
                  Text(height.toString() + ' cm'),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              (height == 120) ? height = 120 : height--;
                            });
                          },
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
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
                        Text(s.weight, style: theme.textTheme.bodyText1),
                        Text(weight.toString() + ' kg'),
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
                              SizedBox(width: 12.0),
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
                        Text(s.age, style: theme.textTheme.bodyText1),
                        Text(age.toString()),
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
                              SizedBox(width: 12.0),
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
                  age: age,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        Result(
                            date: DateTime.now().toString(),
                            bmi: calc.calculateBmi(),
                            result: calc.getBmiResult(),
                            bmr: selectedGender == Gender.maleCard
                                ? calc.calculateBmrMen()
                                : calc.calculateBmrWomen(),
                            ibw: selectedGender == Gender.maleCard
                                ? calc.calculateIbwMen()
                                : calc.calculateIbwWomen()),
                        calc.getInterpretation(),
                      );
                    },
                  ),
                );
              },
              text: s.calculate,
            )
          ],
        ),
      ),
    );
  }
}
