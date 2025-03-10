import 'package:ciland/features/movies/entity/film.dart';
import 'package:ciland/features/movies/repository/abstract_films_repository.dart';

class MoviesUseCase {
  final AbstractMoviesRepository _moviesRepository;

  MoviesUseCase(this._moviesRepository);

    Future<List<Movie>> getTopMovies() async {
    var moviesListDto = await _moviesRepository.getTopMovies();
    List<Movie> moviesList = moviesListDto.map((e) => Movie.fromModel(e)).toList();
    return moviesList;
  }
}

