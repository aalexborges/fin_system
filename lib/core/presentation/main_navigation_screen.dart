import 'dart:io';

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
    if (Platform.isIOS || Platform.isMacOS) {
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.building_2_fill),
              label: 'Bancos',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.creditcard),
              label: 'Contas',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Bancos',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.creditcard),
              label: 'Cartões',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_right_arrow_left),
              label: 'Transações',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.flag),
              label: 'Metas',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar_alt_fill),
              label: 'Patrimonio',
            ),
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
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Bancos',
            ),
            NavigationDestination(
              icon: Icon(Icons.credit_card_outlined),
              selectedIcon: Icon(Icons.credit_card),
              label: 'Cartões',
            ),
            NavigationDestination(
              icon: Icon(Icons.swap_horiz_outlined),
              selectedIcon: Icon(Icons.swap_horiz),
              label: 'Transações',
            ),
            NavigationDestination(
              icon: Icon(Icons.flag_outlined),
              selectedIcon: Icon(Icons.flag),
              label: 'Metas',
            ),
            // NavigationDestination(
            //   icon: Icon(Icons.bar_chart_outlined),
            //   selectedIcon: Icon(Icons.bar_chart),
            //   label: 'Patrimonio',
            // ),
          ],
        ),
      ),
    );
  }
}
