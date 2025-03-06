import 'package:ciland/features/movie_details/models/movie_details.dart';

abstract class AbstractMovieDetailsRepository {
  const AbstractMovieDetailsRepository();

  Future<MovieDetailsModel> getMovieDetails(String id);
}
