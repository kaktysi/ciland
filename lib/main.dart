import 'package:ciland/ci_land_app.dart';
import 'package:ciland/features/movies/repository/abstract_films_repository.dart';
import 'package:ciland/features/movies/usecase/movies_usecase.dart';
import 'package:ciland/features/movies/repository/imdb_repository.dart';
import 'package:ciland/features/movie_details/repository/imdb_movie_details_repository.dart';
import 'package:ciland/features/movie_details/repository/movie_details_repository.dart';
import 'package:ciland/features/movie_details/usecase/movie_details_usecase.dart';
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

  GetIt.I.registerLazySingleton<AbstractMoviesRepository>(
    () => IMDBRepository(Dio()),
  );
  GetIt.I.registerLazySingleton<MoviesUseCase>(
    () => MoviesUseCase(GetIt.I<AbstractMoviesRepository>()),
  );
  GetIt.I.registerLazySingleton<AbstractMovieDetailsRepository>(
    () => ImdbMovieDetailsRepository(Dio()),
  );
  GetIt.I.registerLazySingleton<MovieDetailsUseCase>(
    () => MovieDetailsUseCase(GetIt.I<AbstractMovieDetailsRepository>()),
  );
  usePathUrlStrategy();
  runApp(
    MultiProvider(
      providers: [Provider<AppRouter>(create: (_) => AppRouter())],
      child: CiLandApp(),
    ),
  );
}
