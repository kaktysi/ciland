import 'package:ciland/features/films/models/film_card.dart';
import 'package:ciland/features/films/models/movie_type.dart';

class Film {
  final String id;
  final String primarytitle;
  final String description;
  final String primaryImage;
  final bool isAdult;
  final double averageRating;
  final int startYear;
  final List<String> genres;
  final MovieType movieType;

  Film({
    required this.id,
    required this.primarytitle,
    required this.description,
    required this.primaryImage,
    required this.isAdult,
    required this.averageRating,
    required this.startYear,
    required this.genres,
    required this.movieType,
  });

  factory Film.fromModel(FilmCard model) {
    return Film(
      id: model.id,
      primarytitle: model.primaryTitle,
      description: model.description,
      primaryImage: model.primaryImage,
      isAdult: model.isAdult,
      averageRating: model.averageRating,
      startYear: model.startYear,
      genres: model.genres,
      movieType: model.type,
    );
  }
}
