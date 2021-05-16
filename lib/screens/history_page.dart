import 'package:bmi_calculator/components/bottom_bar.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/models/result.dart';
import 'package:bmi_calculator/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bmi_calculator/generated/l10n.dart';

class HistoryPage extends StatefulWidget {
  final List<Result> results;
  final Future<Database>? database;
  final bool fromInputPage;

  HistoryPage(this.results, this.database, this.fromInputPage);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return widget.results.length != 0
        ? Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 20,
              title:
                  Text(S.of(context).history, style: theme.textTheme.headline4),
              actions: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            backgroundColor: theme.scaffoldBackgroundColor,
                            title: Text(s.deleteHistory,
                                style: theme.textTheme.bodyText1),
                            content: Text(s.areYouSure,
                                style: theme.textTheme.bodyText2),
                            actionsPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            actions: [
                              BottomBar(
                                onTap: () => Navigator.pop(context),
                                text: s.no,
                                width: 100,
                              ),
                              BottomBar(
                                onTap: () async {
                                  Database db = await widget.database!;
                                  db.delete('result');
                                  setState(() {
                                    widget.results.clear();
                                  });
                                  Navigator.pop(context);
                                },
                                text: s.yes,
                                width: 100,
                              ),
                            ],
                          );
                        });
                  },
                )
              ],
            ),
            body: Stack(
              children: [
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 100),
                    itemCount: widget.results.length,
                    itemBuilder: (context, index) => ReusableCard(
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12.0),
                                title: Text(
                                  '${s.date} : ' +
                                      widget.results[index].date!
                                          .substring(0, 10),
                                  style: theme.textTheme.bodyText1,
                                ),
                                subtitle: Text(
                                  '${s.time} : ' +
                                      widget.results[index].date!
                                          .substring(11, 16),
                                  style: theme.textTheme.bodyText2!
                                      .copyWith(fontSize: 16),
                                ),
                                trailing: Text(
                                  widget.results[index].result!,
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color:
                                        widget.results[index].result == s.normal
                                            ? Colors.green
                                            : Colors.red,
                                  ),
                                ),
                              ),
                              buildRow('BMI', 'BMR', 'IBW',
                                  theme.textTheme.bodyText1!),
                              buildRow(
                                  widget.results[index].bmi!,
                                  widget.results[index].bmr!,
                                  widget.results[index].ibw!,
                                  theme.textTheme.headline5!
                                      .copyWith(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          lightColor.withOpacity(0.0),
                          lightColor.withOpacity(0.5),
                          lightColor.withOpacity(0.75),
                          lightColor,
                        ],
                            stops: [
                          0.02,
                          0.075,
                          0.1,
                          0.15
                        ])),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomBar(
                    text: s.goBack,
                    onTap: () => Navigator.pop(context),
                  ),
                )
              ],
            ))
        : Scaffold(
            body: Center(
              child: Column(
                children: [
                  Spacer(flex: 3),
                  Lottie.asset('assets/no_history.json',
                      width: MediaQuery.of(context).size.width / 2),
                  SizedBox(height: 20.0),
                  Text(s.noHistory),
                  Spacer(flex: 4),
                  BottomBar(
                    onTap: () {
                      if (!widget.fromInputPage) {
                        Navigator.pop(context);
                      }
                      Navigator.pop(context);
                    },
                    text: s.calculateNow,
                  ),
                ],
              ),
            ),
          );
  }

  Row buildRow(String text1, String text2, String text3, TextStyle textStyle) {
    return Row(
      children: [
        Expanded(
            child: Text(
          text1,
          textAlign: TextAlign.center,
          style: textStyle,
        )),
        Expanded(
            child: Text(
          text2,
          textAlign: TextAlign.center,
          style: textStyle,
        )),
        Expanded(
            child: Text(
          text3,
          textAlign: TextAlign.center,
          style: textStyle,
        ))
      ],
    );
  }
}
