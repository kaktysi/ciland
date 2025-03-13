import 'package:ciland/app_config.dart';
import 'package:ciland/features/movies/models/movie_card.dart';
import 'package:ciland/features/movies/repository/abstract_films_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbstractMoviesRepository)
class IMDBRepository implements AbstractMoviesRepository {
  final Dio _dio;

  IMDBRepository(this._dio);

  @override
  Future<List<MovieCard>> getTopMovies({required String movieType}) async {
    final response = await _dio.get<List<dynamic>>(
      'https://imdb236.p.rapidapi.com/imdb/top250-$movieType',
      options: Options(
        headers: {
          'X-Rapidapi-Key': AppConfig.apikey,
          'X-Rapidapi-Host': 'imdb236.p.rapidapi.com',
        },
      ),
    );
    return response.data?.map((e) => MovieCard.fromJson(e)).toList() ?? [];
  }

  @override
  Future<List<MovieCard>> getMoviesBySearch({
    required String movieType,
    required String text,
  }) async {
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
    return results.map((e) => MovieCard.fromJson(e)).toList();
  }
}
