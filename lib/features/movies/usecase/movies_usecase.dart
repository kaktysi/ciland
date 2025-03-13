import 'package:ciland/features/movies/entity/film.dart';
import 'package:ciland/features/movies/repository/abstract_films_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MoviesUseCase {
  final AbstractMoviesRepository _moviesRepository;

  MoviesUseCase(this._moviesRepository);

  Future<List<Movie>> getTopMovies({required String movieType}) async {
    var moviesListDto = await _moviesRepository.getTopMovies(
      movieType: movieType,
    );
    List<Movie> moviesList =
        moviesListDto.map((e) => Movie.fromModel(e)).toList();
    return _filterMoviesList(moviesList);
  }

  Future<List<Movie>> getMoviesBySearch({
    required String movieType,
    required String text,
  }) async {
    var moviesListDto = await _moviesRepository.getMoviesBySearch(
      movieType: movieType,
      text: text,
    );
    List<Movie> moviesList =
        moviesListDto.map((e) => Movie.fromModel(e)).toList();
    return _filterMoviesList(moviesList);
  }
}

List<Movie> _filterMoviesList(List<Movie> list) {
  return list
      .where(
        (e) =>
            e.genres.isNotEmpty &&
            e.startYear != 0 &&
            e.averageRating != 0 &&
            e.id.isNotEmpty &&
            e.primarytitle.isNotEmpty,
      )
      .toList();
}
