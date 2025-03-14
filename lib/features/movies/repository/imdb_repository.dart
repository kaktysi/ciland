import 'dart:developer';

import 'package:ciland/app_config.dart';
import 'package:ciland/features/movies/models/movie_card.dart';
import 'package:ciland/features/movies/repository/abstract_films_repository.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbstractMoviesRepository)
class IMDBRepository implements AbstractMoviesRepository {
  final Dio _dio;
  final Box<MovieCard> _movieCardBox;

  IMDBRepository(this._dio, this._movieCardBox);

  @override
  Future<List<MovieCard>> getTopMovies({required String movieType}) async {
    var movieList = <MovieCard>[];
    try {
      final response = await _dio.get<List<dynamic>>(
        'https://imdb236.p.rapidapi.com/imdb/top250-$movieType',
        options: Options(
          headers: {
            'X-Rapidapi-Key': AppConfig.apikey,
            'X-Rapidapi-Host': 'imdb236.p.rapidapi.com',
          },
        ),
      );
      movieList =
          response.data?.map((e) => MovieCard.fromJson(e)).toList() ?? [];
      final movieCardMap = {for (var e in movieList) e.id: e};
      await _movieCardBox.putAll(movieCardMap);
    } catch (e) {
      log(e.toString());
      movieList =
          _movieCardBox.values
              .toList()
              .where(
                (e) =>
                    (movieType == 'movie' ? e.type.isMovie : !e.type.isMovie),
              )
              .toList();
      movieList.sort((a, b) => b.averageRating.compareTo(a.averageRating));
    }
    return movieList;
  }

  @override
  Future<List<MovieCard>> getMoviesBySearch({
    required String movieType,
    required String text,
  }) async {
    var movieList = <MovieCard>[];

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'https://imdb236.p.rapidapi.com/imdb/search?primaryTitle=$text&type=$movieType&rows=100&sortOrder=ASC&sortField=id',
        options: Options(
          headers: {
            'X-Rapidapi-Key': AppConfig.apikey,
            'X-Rapidapi-Host': 'imdb236.p.rapidapi.com',
          },
        ),
      );
      final List<dynamic> results = response.data?['results'] ?? [];
      movieList = results.map((e) => MovieCard.fromJson(e)).toList();
      final movieCardMap = {for (var e in movieList) e.primaryTitle: e};
      await _movieCardBox.putAll(movieCardMap);
    } catch (e) {
      movieList =
          _movieCardBox.values
              .toList()
              .where(
                (e) =>
                    (movieType == 'movie' ? e.type.isMovie : !e.type.isMovie),
              )
              .toList();
      movieList.sort((a, b) => b.averageRating.compareTo(a.averageRating));
    }
    return movieList;
  }
}
