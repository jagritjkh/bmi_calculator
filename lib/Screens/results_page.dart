import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/bottom_bar.dart';

class ResultsPage extends StatelessWidget {
  final String finalBmi;
  final String result;
  final String interpretation;
  final String finalBmr;
  final String finalIbw;

  ResultsPage(
      {@required this.finalBmi,
      @required this.result,
      @required this.interpretation,
      @required this.finalBmr,
      @required this.finalIbw});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 12.0),
                child: Text(
                  'Your Result',
                  style: kFontTextStyle,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16.0),
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            alignment: Alignment.center,
                            child: Text(
                              "BMR Result",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              finalBmr,
                              style: kFontTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16.0),
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Ideal Body Weight",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              finalIbw,
                              style: kFontTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(6.0),
                              alignment: Alignment.center,
                              child: Text(
                                "BMI Result",
                                style: kLabelTextStyle.copyWith(fontSize: 24.0),
                              ),
                            ),
                            Text(
                              result.toUpperCase(),
                              style: result == 'Normal'
                                  ? kResultTextStyle
                                  : kResultTextStyle.copyWith(
                                      color: Colors.red),
                            ),
                            Text(
                              finalBmi,
                              style: kFontTextStyle,
                            ),
                            Text(
                              interpretation,
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomBar(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: 'RE-CALCULATE'),
            ],
          ),
        ),
      ),
    );
  }
}
