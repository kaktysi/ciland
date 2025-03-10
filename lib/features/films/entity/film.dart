import 'package:ciland/features/films/models/movie_card.dart';
import 'package:ciland/features/films/models/movie_type.dart';

class Movie {
  final String id;
  final String primarytitle;
  final String description;
  final String primaryImage;
  final bool isAdult;
  final double averageRating;
  final int startYear;
  final List<String> genres;
  final MovieType movieType;

  Movie({
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

  factory Movie.fromModel(MovieCard model) {
    return Movie(
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
