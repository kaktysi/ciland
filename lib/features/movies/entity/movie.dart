import 'package:ciland/features/movies/models/movie_card.dart';
import 'package:ciland/features/movies/models/movie_type.dart';
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String id;
  final String primarytitle;
  final String description;
  final String primaryImage;
  final bool isAdult;
  final double averageRating;
  final int startYear;
  final List<String> genres;
  final MovieType movieType;

  const Movie({
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

  @override
  List<Object?> get props => [
    id,
    primarytitle,
    description,
    primaryImage,
    isAdult,
    averageRating,
    startYear,
    genres,
    movieType,
  ];
}
