import 'package:ciland/features/films/models/movie_card.dart';

abstract class AbstractFilmsRepository {
  const AbstractFilmsRepository();

  Future<List<MovieCard>> getTopFilms();
}