import 'package:bmi_calculator/components/custom_box_decoration.dart';
import 'package:bmi_calculator/models/result.dart';
import 'package:bmi_calculator/screens/history_page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bmi_calculator/generated/l10n.dart';

class DatabaseHelper {
  Future<Database>? database;

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
    final Database db = await database!;
    await db.insert('result', result.toMap());
  }

  Future<List<Result>> getResults() async {
    final Database db = await database!;
    final List<Map<String, dynamic>> maps = await db.query('result');
    return List.generate(maps.length, (i) {
      return Result.fromMap(maps[i]);
    });
  }
}

class HistoryTile extends StatelessWidget {
  final bool fromInputPage;

  HistoryTile([this.fromInputPage = true]);

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: CustomDecoration.decoration(theme),
      child: ListTile(
          leading: Icon(Icons.history, color: theme.backgroundColor),
          title: Text(S.of(context).history, style: theme.textTheme.bodyText1),
          onTap: () async {
            List<Result> results = await _databaseHelper.getResults();
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryPage(
                        results, _databaseHelper.database, fromInputPage)));
          }),
    );
  }
}
