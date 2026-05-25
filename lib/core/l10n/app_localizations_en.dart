// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FinSystem';

  @override
  String get homeTab => 'Home';

  @override
  String get cardsTab => 'Cards';

  @override
  String get transactionsTab => 'Transactions';

  @override
  String get goalsTab => 'Goals';

  @override
  String get homeAppBarTitle => 'Checking account';

  @override
  String get cardsAppBarTitle => 'Cards';

  @override
  String get transactionsAppBarTitle => 'Transactions';

  @override
  String get goalsAppBarTitle => 'Goals';
}

/// The translations for English, as used in the United Kingdom (`en_GB`).
class AppLocalizationsEnGb extends AppLocalizationsEn {
  AppLocalizationsEnGb() : super('en_GB');

  @override
  String get homeAppBarTitle => 'Current account';
}
