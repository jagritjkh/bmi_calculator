import 'package:bmi_calculator/app_config/app_config.dart';
import 'package:bmi_calculator/functions/database_helper.dart';
import 'package:bmi_calculator/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'custom_box_decoration.dart';
import 'round_icon_button.dart';

class MoreButton extends StatelessWidget {
  final bool fromInputPage;

  MoreButton([this.fromInputPage = true]);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return RoundIconButton(
      icon: Icons.more_vert,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: theme.scaffoldBackgroundColor,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              borderSide: BorderSide.none,
            ),
            builder: (context) => Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 6,
                        width: 60,
                        decoration: BoxDecoration(
                            color: theme.accentColor,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(height: 20),
                      HistoryTile(fromInputPage),
                      SizedBox(height: 20),
                      Container(
                        decoration: CustomDecoration.decoration(theme),
                        child: ListTile(
                          leading: Icon(
                            Icons.share,
                            color: theme.backgroundColor,
                          ),
                          title: Text(
                            s.share,
                            style: theme.textTheme.bodyText1,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Share.share(
                              '${s.heyIFound} BMI, BMR & Ideal Body Weight ${s.on}' +
                                  ' Play Store!' +
                                  "\n" +
                                  AppConfig.appName +
                                  "\n" +
                                  "https://play.google.com/store/apps/details?id=" +
                                  AppConfig.packageName,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ));
      },
    );
  }
}
