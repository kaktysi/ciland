
import 'package:ciland/app_config.dart';
import 'package:ciland/features/movies/models/movie_type.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ciland/features/movies/models/movie_card.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieTypeAdapter());
  Hive.registerAdapter(MovieCardAdapter());

  final movieCardBox = await Hive.openBox<MovieCard>(
    AppConfig.movieHiveCardBoxName,
  );

  getIt.registerSingleton<Box<MovieCard>>(movieCardBox);
  getIt.registerSingleton<Dio>(Dio());

  getIt.init();
}
