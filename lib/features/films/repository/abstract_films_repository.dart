import 'package:ciland/features/films/models/film_card.dart';

abstract class AbstractFilmsRepository {
  const AbstractFilmsRepository();

  Future<List<FilmCard>> getTopFilms();

}