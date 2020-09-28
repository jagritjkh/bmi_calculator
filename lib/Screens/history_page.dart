import 'package:bmi_calculator/Components/bottom_bar.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sqflite/sqflite.dart';
import '../Theme/constants.dart';
import '../Models/result.dart';
import '../Theme/style.dart';

class HistoryPage extends StatefulWidget {
  final List<Result> results;
  final Future<Database> database;
  final bool fromInputPage;

  HistoryPage(this.results, this.database, this.fromInputPage);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.results);
    return widget.results.length != 0
        ? Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(' History', style: kFontTextStyle),
              actions: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              backgroundColor: backgroundColor,
                              title: Text('Delete history'),
                              content: Text(
                                  'Are you sure? Do you want to delete history?'),
                              actions: [
                                BottomBar(
                                  onTap: () => Navigator.pop(context),
                                  text: 'No',
                                  width: 100,
                                ),
                                BottomBar(
                                  onTap: () async {
                                    Database db = await widget.database;
                                    db.delete('result');
                                    setState(() {
                                      widget.results.clear();
                                    });
                                    Navigator.pop(context);
                                  },
                                  text: 'Yes',
                                  width: 100,
                                ),
                              ],
                            ));
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
                                  'Date : ' +
                                      widget.results[index].date
                                          .substring(0, 10),
                                  style: kLabelTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'Time : ' +
                                      widget.results[index].date
                                          .substring(11, 16),
                                  style: kLabelTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  widget.results[index].result,
                                  style: kLabelTextStyle.copyWith(
                                      color: widget.results[index].result ==
                                              'Normal'
                                          ? Colors.green.shade500
                                          : Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              buildRow('BMI', 'BMR', 'IBW', kLabelTextStyle),
                              buildRow(
                                  widget.results[index].bmi,
                                  widget.results[index].bmr,
                                  widget.results[index].ibw,
                                  kFontTextStyle.copyWith(fontSize: 28)),
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
                          backgroundColor.withOpacity(0.0),
                          backgroundColor.withOpacity(0.5),
                          backgroundColor.withOpacity(0.75),
                          backgroundColor,
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
                    text: 'Go back',
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
                  Text(
                    'No history!',
                    style:
                        kFontTextStyle /*.copyWith(color: Colors.grey.shade600)*/,
                  ),
                  Spacer(flex: 4),
                  BottomBar(
                    onTap: () {
                      if (!widget.fromInputPage) {
                        Navigator.pop(context);
                      }
                      Navigator.pop(context);
                    },
                    text: 'Calculate Now',
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
