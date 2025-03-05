import 'package:ciland/app_config.dart';
import 'package:ciland/features/films/view/films_screen.dart';
import 'package:ciland/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final String startTab = 'films';

  late final router = GoRouter(
    routes: [
      GoRoute(
        name: AppConfig.rootRouteName,
        path: '/',
        redirect: (context, state) => '/${AppConfig.homeRouteName}/$startTab',
      ),
      ShellRoute(
        builder: (context, state, child) {
          var tab = state.uri.toString().split('/')[2];
          bool useChild = state.uri.toString().split('/').length > 3;
          return HomeScreen(tab: tab, child: useChild ? child : null);
        },
        routes: [
          GoRoute(
            name: AppConfig.homeRouteName,
            path: '/home/:tab',
            builder: (context, state) {
              return const SizedBox();
            },
            routes: [
              GoRoute(
                name: AppConfig.appRouteName,
                path: 'ciland',
                builder: (context, state) => FilmsScreen(),
              ),
              GoRoute(
                name: AppConfig.filmsRouteName,
                path: 'films',
                builder: (context, state) => FilmsScreen(),
              ),
              GoRoute(
                name: AppConfig.seriesRouteName,
                path: 'series',
                builder: (context, state) => FilmsScreen(),
              ),
              GoRoute(
                name: AppConfig.helpRouteName,
                path: 'help',
                builder: (context, state) => FilmsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
