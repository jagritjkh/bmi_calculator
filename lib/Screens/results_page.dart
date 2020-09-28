import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/bottom_bar.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../result.dart';
import 'history_page.dart';

class ResultsPage extends StatefulWidget {
  final Result result;
  final String interpretation;

  ResultsPage(this.result, this.interpretation);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  Future<Database> database;

  Future<void> saveResult() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'results.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE result(date TEXT PRIMARY KEY, result TEXT, bmi TEXT, bmr TEXT, ibw TEXT)');
      },
      version: 1,
    );
    final Database db = await database;
    await db.insert('result', widget.result.toMap());
  }

  Future<List<Result>> getResults() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('result');
    return List.generate(maps.length, (i) {
      return Result.fromMap(maps[i]);
    });
  }

  @override
  void initState() {
    super.initState();
    saveResult();
  }

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
              onPressed: () async {
                List<Result> results = await getResults();
                if (results != null || results.length != 0) {
                  print(results);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HistoryPage(results, database)));
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('No history!'),
                  ));
                }
              }),
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
