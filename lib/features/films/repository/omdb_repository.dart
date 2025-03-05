import 'package:ciland/app_config.dart';
import 'package:ciland/features/films/models/film_card.dart';
import 'package:ciland/features/films/repository/asbtract_films_repository.dart';
import 'package:dio/dio.dart';

class OMDBRepository implements AsbtractFilmsRepository {
  final Dio _dio;

  OMDBRepository(this._dio);

  @override
  Future<List<FilmCard>> getFilmsByFilters() async {
    final response = await _dio.get<List<dynamic>>(
      'https://www.omdbapi.com',
      queryParameters: {'q': AppConfig.apikey},
      options: Options(
        headers: {
          'X-Rapidapi-Key': AppConfig.apikey,
          'X-Rapidapi-Host': 'imdb8.p.rapidapi.com',
        },
      ),
    );
    return response.data?.map((e) => FilmCard.fromJson(e)).toList() ?? [];
  }

  @override
  Future<List<FilmCard>> getFilmDetails() async {
    final response = await _dio.get<List<dynamic>>('https://www.omdbapi.com');
    return response.data?.map((e) => FilmCard.fromJson(e)).toList() ?? [];
  }

  @override
  Future<List<FilmCard>> getTopFilms() async {
    final response = await _dio.get<List<dynamic>>(
      'https://imdb236.p.rapidapi.com/imdb/top250-movies',
      options: Options(
        headers: {
          'X-Rapidapi-Key': AppConfig.apikey,
          'X-Rapidapi-Host': 'imdb236.p.rapidapi.com',
        },
      ),
    );
    return response.data?.map((e) => FilmCard.fromJson(e)).toList() ?? [];
  }
}
