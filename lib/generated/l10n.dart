// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get calculate {
    return Intl.message(
      'Calculate',
      name: 'calculate',
      desc: '',
      args: [],
    );
  }

  /// `Your Result`
  String get yourResult {
    return Intl.message(
      'Your Result',
      name: 'yourResult',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result {
    return Intl.message(
      'Result',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Ideal Body Weight`
  String get idealBody {
    return Intl.message(
      'Ideal Body Weight',
      name: 'idealBody',
      desc: '',
      args: [],
    );
  }

  /// `You are underweight.`
  String get youAreUnderweight {
    return Intl.message(
      'You are underweight.',
      name: 'youAreUnderweight',
      desc: '',
      args: [],
    );
  }

  /// `Have some more food!`
  String get moreFood {
    return Intl.message(
      'Have some more food!',
      name: 'moreFood',
      desc: '',
      args: [],
    );
  }

  /// `You have a normal body weight.`
  String get normalWeight {
    return Intl.message(
      'You have a normal body weight.',
      name: 'normalWeight',
      desc: '',
      args: [],
    );
  }

  /// `Great going!`
  String get greatGoing {
    return Intl.message(
      'Great going!',
      name: 'greatGoing',
      desc: '',
      args: [],
    );
  }

  /// `Your body weight is higher than normal.`
  String get higherWeight {
    return Intl.message(
      'Your body weight is higher than normal.',
      name: 'higherWeight',
      desc: '',
      args: [],
    );
  }

  /// `Exercise more!`
  String get exerciseMore {
    return Intl.message(
      'Exercise more!',
      name: 'exerciseMore',
      desc: '',
      args: [],
    );
  }

  /// `Underweight`
  String get underweight {
    return Intl.message(
      'Underweight',
      name: 'underweight',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get normal {
    return Intl.message(
      'Normal',
      name: 'normal',
      desc: '',
      args: [],
    );
  }

  /// `Overweight`
  String get overweight {
    return Intl.message(
      'Overweight',
      name: 'overweight',
      desc: '',
      args: [],
    );
  }

  /// `less than 18`
  String get lessThan18 {
    return Intl.message(
      'less than 18',
      name: 'lessThan18',
      desc: '',
      args: [],
    );
  }

  /// `between 18 and 25`
  String get between18And25 {
    return Intl.message(
      'between 18 and 25',
      name: 'between18And25',
      desc: '',
      args: [],
    );
  }

  /// `more than 25`
  String get moreThan25 {
    return Intl.message(
      'more than 25',
      name: 'moreThan25',
      desc: '',
      args: [],
    );
  }

  /// `RE-CALCULATE`
  String get reCalculate {
    return Intl.message(
      'RE-CALCULATE',
      name: 'reCalculate',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Delete history`
  String get deleteHistory {
    return Intl.message(
      'Delete history',
      name: 'deleteHistory',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure? Do you want to delete history?`
  String get areYouSure {
    return Intl.message(
      'Are you sure? Do you want to delete history?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Go back`
  String get goBack {
    return Intl.message(
      'Go back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `No history!`
  String get noHistory {
    return Intl.message(
      'No history!',
      name: 'noHistory',
      desc: '',
      args: [],
    );
  }

  /// `Calculate Now!`
  String get calculateNow {
    return Intl.message(
      'Calculate Now!',
      name: 'calculateNow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
