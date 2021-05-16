import 'package:bmi_calculator/components/bottom_bar.dart';
import 'package:bmi_calculator/components/more_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/functions/database_helper.dart';
import 'package:bmi_calculator/models/result.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/generated/l10n.dart';

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
    var theme = Theme.of(context);
    var s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Text(s.yourResult, style: theme.textTheme.headline4),
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
                        Text("BMR ${s.result}",
                            style: theme.textTheme.bodyText1),
                        Text(widget.result.bmr!,
                            style: theme.textTheme.bodyText2!
                                .copyWith(fontSize: 16)),
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
                        Text(s.idealBody, style: theme.textTheme.bodyText1),
                        Text(
                          widget.result.ibw!,
                          style:
                              theme.textTheme.bodyText2!.copyWith(fontSize: 16),
                        ),
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
                    Text("BMI ${s.result}", style: theme.textTheme.headline5),
                    Text(
                      widget.result.result!.toUpperCase(),
                      style: widget.result.result == s.normal
                          ? theme.textTheme.headline6!
                              .copyWith(color: Colors.green)
                          : theme.textTheme.bodyText1!
                              .copyWith(color: Colors.red),
                    ),
                    Text(
                      widget.result.bmi!,
                      style: theme.textTheme.headline4,
                    ),
                    Text(
                      widget.interpretation,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            ReusableCard(
              cardChild: Text(
                s.underweight +
                    s.lessThan18 +
                    '\n' +
                    s.normal +
                    s.between18And25 +
                    '\n' +
                    s.overweight +
                    s.moreThan25,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyText2!.copyWith(fontSize: 16),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: BottomBar(
                      onTap: () => Navigator.pop(context), text: s.reCalculate),
                ),
                MoreButton(false),
                SizedBox(
                  width: 16,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
