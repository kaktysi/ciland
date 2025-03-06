import 'package:ciland/app_config.dart';
import 'package:ciland/features/films/models/film_card.dart';
import 'package:ciland/features/films/repository/abstract_films_repository.dart';
import 'package:dio/dio.dart';

class IMDBRepository implements AbstractFilmsRepository {
  final Dio _dio;

  IMDBRepository(this._dio);

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
