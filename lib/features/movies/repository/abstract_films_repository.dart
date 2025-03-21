import 'package:ciland/features/movies/models/movie_card.dart';

abstract class AbstractMoviesRepository {
  const AbstractMoviesRepository();

  Future<List<MovieCard>> getTopMovies({required String movieType});
  Future<List<MovieCard>> getMoviesBySearch({
    required String movieType,
    required String text,
  });
}
