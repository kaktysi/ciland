import 'package:ciland/features/films/models/film_card.dart';

abstract class AsbtractFilmsRepository {
  const AsbtractFilmsRepository();

  Future<List<FilmCard>> getFilmsByFilters();

  Future<List<FilmCard>> getFilmDetails();

  Future<List<FilmCard>> getTopFilms();

}