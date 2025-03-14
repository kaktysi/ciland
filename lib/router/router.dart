import 'package:ciland/app_config.dart';
import 'package:ciland/features/home/view/home_screen.dart';
import 'package:ciland/features/movie_details/view/movie_details_screen.dart';
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
            path: '/home/:tab(films|series|help)',
            builder: (context, state) {
              return const SizedBox();
            },
            routes: [
              GoRoute(
                name: '${AppConfig.filmsRouteName}_details_id',
                path: 'details/:id',
                builder: (context, state) {
                  if (state.pathParameters['id'] == null) return Scaffold();
                  var id = state.pathParameters['id']!;
                  return MovieDetailsScreen(id: id);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
