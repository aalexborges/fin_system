import 'package:fin_system/core/presentation/main_navigation_screen.dart';
import 'package:fin_system/features/cards/presentation/cards_page.dart';
import 'package:fin_system/features/goals/presentation/goals_page.dart';
import 'package:fin_system/features/home/presentation/home_page.dart';
import 'package:fin_system/features/transactions/presentation/transactions_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainNavigationScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cards',
                name: 'cards',
                builder: (context, state) => const CardsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                name: 'transactions',
                builder: (context, state) => const TransactionsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/goals',
                name: 'goals',
                builder: (context, state) => const GoalsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
