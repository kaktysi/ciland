import 'package:ciland/features/films/entity/film.dart';
import 'package:ciland/features/films/repository/asbtract_films_repository.dart';

class FilmsUseCase {
  final AsbtractFilmsRepository _filmsRepository;

  FilmsUseCase(this._filmsRepository);

  Future<List<Film>> getFilmsByFilters() async {
    var filmsListDto = await _filmsRepository.getFilmsByFilters();
    List<Film> filmsList = filmsListDto.map((e) => Film.fromModel(e)).toList();
    return filmsList;
  }

  Future<List<Film>> getFilmDetails() async {
    var filmsListDto = await _filmsRepository.getFilmDetails();
    List<Film> filmsList = filmsListDto.map((e) => Film.fromModel(e)).toList();
    return filmsList;
  }

    Future<List<Film>> getTopFilms() async {
    var filmsListDto = await _filmsRepository.getTopFilms();
    List<Film> filmsList = filmsListDto.map((e) => Film.fromModel(e)).toList();
    return filmsList;
  }
}

