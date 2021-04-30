import 'package:bmi_calculator/components/bottom_bar.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/functions/database_helper.dart';
import 'package:bmi_calculator/models/result.dart';
import 'package:bmi_calculator/theme/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  final Result result;
  final String interpretation;

  ResultsPage(this.result, this.interpretation);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _databaseHelper.saveResult(widget.result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(' Your Result', style: kFontTextStyle),
        actions: [
          HistoryButton(false),
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
                        Text(widget.result.bmr, style: kFontTextStyle),
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
                        Text(widget.result.ibw, style: kFontTextStyle),
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
                      widget.result.result.toUpperCase(),
                      style: widget.result.result == 'Normal'
                          ? kResultTextStyle
                          : kResultTextStyle.copyWith(color: Colors.red),
                    ),
                    Text(widget.result.bmi, style: kFontTextStyle),
                    Text(
                      widget.interpretation,
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
                onTap: () => Navigator.pop(context), text: 'RE-CALCULATE'),
          ],
        ),
      ),
    );
  }
}
