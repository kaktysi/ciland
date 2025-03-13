import 'package:ciland/app_config.dart';
import 'package:ciland/features/movie_details/models/movie_details.dart';
import 'package:ciland/features/movie_details/repository/movie_details_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbstractMovieDetailsRepository)
class ImdbMovieDetailsRepository extends AbstractMovieDetailsRepository {
  final Dio _dio;

  ImdbMovieDetailsRepository(this._dio);

  @override
  Future<MovieDetailsModel> getMovieDetails(String id) async {
    final response = await _dio.get(
      'https://imdb236.p.rapidapi.com/imdb/$id',
      options: Options(
        headers: {
          'X-Rapidapi-Key': AppConfig.apikey,
          'X-Rapidapi-Host': 'imdb236.p.rapidapi.com',
        },
      ),
    );
    return MovieDetailsModel.fromJson(response.data);
  }
}
