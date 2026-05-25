// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'FinSystem';

  @override
  String get homeTab => 'Inicio';

  @override
  String get cardsTab => 'Cartões';

  @override
  String get transactionsTab => 'Transações';

  @override
  String get goalsTab => 'Metas';

  @override
  String get homeAppBarTitle => 'Conta corrente';

  @override
  String get cardsAppBarTitle => 'Cartões';

  @override
  String get transactionsAppBarTitle => 'Transações';

  @override
  String get goalsAppBarTitle => 'Metas';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');
}
