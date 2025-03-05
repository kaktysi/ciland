import 'package:ciland/ci_land_app.dart';
import 'package:ciland/features/films/repository/asbtract_films_repository.dart';
import 'package:ciland/features/films/repository/omdb_repository.dart';
import 'package:ciland/features/films/usecase/films_usecase.dart';
import 'package:ciland/router/router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  GetIt.I.registerLazySingleton<AsbtractFilmsRepository>(
    () => OMDBRepository(Dio()),
  );
  GetIt.I.registerLazySingleton<FilmsUseCase>(
    () => FilmsUseCase(GetIt.I<AsbtractFilmsRepository>()),
  );
  usePathUrlStrategy();
  runApp(
    MultiProvider(
      providers: [Provider<AppRouter>(create: (_) => AppRouter())],
      child: CiLandApp(),
    ),
  );
}
