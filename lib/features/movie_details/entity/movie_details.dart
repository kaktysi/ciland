import 'package:ciland/features/films/entity/film.dart';
import 'package:ciland/features/movie_details/models/movie_details.dart';
import 'package:ciland/features/movie_details/models/person.dart';

class MovieDetails extends Film {
  final int runtimeMinutes;
  final int numVotes;
  final int budget;
  final int? endYear;
  final String language;
  final List<String> countriesOfOrigin;
  final List<String> spokenLanguages;
  final List<Person> directors;
  final List<Person> writers;
  final List<Person> cast;

  MovieDetails({
    required this.runtimeMinutes,
    required this.numVotes,
    required this.budget,
    this.endYear,
    required this.language,
    required this.countriesOfOrigin,
    required this.spokenLanguages,
    required this.directors,
    required this.writers,
    required this.cast,
    required super.id,
    required super.title,
    required super.description,
    required super.primaryImage,
    required super.isAdult,
    required super.averageRating,
    required super.startYear,
    required super.genres,
  });

  factory MovieDetails.fromModel(MovieDetailsModel model) {
    return MovieDetails(
      runtimeMinutes: model.runtimeMinutes,
      numVotes: model.numVotes,
      budget: model.budget,
      language: model.language,
      countriesOfOrigin: model.countriesOfOrigin,
      spokenLanguages: model.spokenLanguages,
      directors: model.directors,
      writers: model.writers,
      cast: model.cast,
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
