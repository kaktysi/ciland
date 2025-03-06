import 'package:ciland/features/films/entity/film.dart';
import 'package:ciland/features/films/repository/abstract_films_repository.dart';

class FilmsUseCase {
  final AbstractFilmsRepository _filmsRepository;

  FilmsUseCase(this._filmsRepository);

    Future<List<Film>> getTopFilms() async {
    var filmsListDto = await _filmsRepository.getTopFilms();
    List<Film> filmsList = filmsListDto.map((e) => Film.fromModel(e)).toList();
    return filmsList;
  }
}

