import 'package:bmi_calculator/Components/bottom_bar.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../style.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(' History', style: kFontTextStyle),
      ),
      body: Stack(
        children: [
          ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Date Time',
                          style: kLabelTextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        buildRow('BMI', 'BMR', 'IBW', kLabelTextStyle),
                        buildRow('BMI', 'BMR', 'IBW',
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
