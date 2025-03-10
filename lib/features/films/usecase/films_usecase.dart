import 'package:ciland/features/films/entity/film.dart';
import 'package:ciland/features/films/repository/abstract_films_repository.dart';

class FilmsUseCase {
  final AbstractFilmsRepository _filmsRepository;

  FilmsUseCase(this._filmsRepository);

    Future<List<Movie>> getTopFilms() async {
    var filmsListDto = await _filmsRepository.getTopFilms();
    List<Movie> filmsList = filmsListDto.map((e) => Movie.fromModel(e)).toList();
    return filmsList;
  }
}

