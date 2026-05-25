import 'dart:io';

import 'package:fin_system/core/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationScreen({super.key, required this.navigationShell});

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (Platform.isIOS || Platform.isMacOS) {
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.building_2_fill),
              label: l10n.homeTab,
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.creditcard),
              label: l10n.cardsTab,
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.arrow_right_arrow_left),
              label: l10n.transactionsTab,
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.flag),
              label: l10n.goalsTab,
            ),
            // BottomNavigationBarItem(
            //   icon: const Icon(CupertinoIcons.chart_bar_alt_fill),
            //   label: 'Patrimonio',
            // ),
          ],
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            TextStyle baseStyle = const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis,
            );

            if (states.contains(WidgetState.selected)) {
              return baseStyle.copyWith(fontWeight: FontWeight.bold);
            }

            return baseStyle;
          }),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => _onTap(context, index),
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: l10n.homeTab,
            ),
            NavigationDestination(
              icon: const Icon(Icons.credit_card_outlined),
              selectedIcon: const Icon(Icons.credit_card),
              label: l10n.cardsTab,
            ),
            NavigationDestination(
              icon: const Icon(Icons.swap_horiz_outlined),
              selectedIcon: const Icon(Icons.swap_horiz),
              label: l10n.transactionsTab,
            ),
            NavigationDestination(
              icon: const Icon(Icons.flag_outlined),
              selectedIcon: const Icon(Icons.flag),
              label: l10n.goalsTab,
            ),
            // NavigationDestination(
            //   icon: const Icon(Icons.bar_chart_outlined),
            //   selectedIcon: const Icon(Icons.bar_chart),
            //   label: 'Patrimonio',
            // ),
          ],
        ),
      ),
    );
  }
}
