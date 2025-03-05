import 'package:ciland/features/films/models/film_card.dart';

class Film {
  final String id;
  final String title;
  final String description;
  final String primaryImage;
  final bool isAdult;
  final double averageRating;
  final int startYear;
  final List<String> genres;

  Film({
    required this.id,
    required this.title,
    required this.description,
    required this.primaryImage,
    required this.isAdult,
    required this.averageRating,
    required this.startYear,
    required this.genres,
  });

  factory Film.fromModel(FilmCard model) {
    return Film(
      id: model.id,
      title: model.originalTitle,
      description: model.description,
      primaryImage: model.primaryImage,
      isAdult: model.isAdult,
      averageRating: model.averageRating,
      startYear: model.startYear,
      genres: model.genres,
    );
  }
}
