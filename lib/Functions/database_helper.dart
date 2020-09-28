import 'package:bmi_calculator/Models/result.dart';
import 'package:bmi_calculator/Screens/history_page.dart';
import 'package:bmi_calculator/Theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> database;

  DatabaseHelper() {
    init();
  }

  Future init() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'results.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE result(date TEXT PRIMARY KEY, result TEXT, bmi TEXT, bmr TEXT, ibw TEXT)');
      },
      version: 1,
    );
  }

  Future<void> saveResult(Result result) async {
    await init();
    final Database db = await database;
    await db.insert('result', result.toMap());
  }

  Future<List<Result>> getResults() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('result');
    return List.generate(maps.length, (i) {
      return Result.fromMap(maps[i]);
    });
  }
}

class HistoryButton extends StatelessWidget {
  final bool fromInputPage;

  HistoryButton([this.fromInputPage = true]);

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.only(right: 20),
        icon: Icon(
          Icons.history,
          size: 28,
          color: kBottomContainerColor,
        ),
        onPressed: () async {
          List<Result> results = await _databaseHelper.getResults();
          if (results != null || results.length != 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryPage(
                        results, _databaseHelper.database, fromInputPage)));
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('No history!'),
            ));
          }
        });
  }
}
