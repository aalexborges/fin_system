import 'dart:io';

import 'package:fin_system/core/l10n/app_localizations.dart';
import 'package:fin_system/core/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Locale _localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale == null) {
      return const Locale('en');
    }

    Locale? partialMatch;

    for (final supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        if (supportedLocale.countryCode == locale.countryCode) {
          return supportedLocale;
        }

        partialMatch ??= supportedLocale;
      }
    }

    return partialMatch ?? const Locale('en');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoApp.router(
        title: 'FinSystem',
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemGreen,
        ),
        routerConfig: router,
        localeResolutionCallback: _localeResolutionCallback,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
    }

    return MaterialApp.router(
      title: 'FinSystem',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      routerConfig: router,
      localeResolutionCallback: _localeResolutionCallback,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
