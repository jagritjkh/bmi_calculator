import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/bottom_bar.dart';

import 'history_page.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(' Your Result', style: kFontTextStyle),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(
              Icons.history,
              size: 28,
              color: kBottomContainerColor,
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistoryPage())),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(height: 12.0),
                        Text("BMR Result"),
                        Text(finalBmr, style: kFontTextStyle),
                        SizedBox(height: 12.0),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(height: 12.0),
                        Text("Ideal Body Weight"),
                        Text(finalIbw, style: kFontTextStyle),
                        SizedBox(height: 12.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "BMI Result",
                      style: kLabelTextStyle.copyWith(fontSize: 24.0),
                    ),
                    Text(
                      result.toUpperCase(),
                      style: result == 'Normal'
                          ? kResultTextStyle
                          : kResultTextStyle.copyWith(color: Colors.red),
                    ),
                    Text(finalBmi, style: kFontTextStyle),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            ReusableCard(
              cardChild: Text(
                'Underweight: less than 18\n'
                'Normal: between 18 and 25\n'
                'Overweight: more than 25',
                textAlign: TextAlign.center,
                style: kLabelTextStyle.copyWith(height: 2),
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
    );
  }
}
