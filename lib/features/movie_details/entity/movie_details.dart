import 'package:ciland/features/films/entity/film.dart';
import 'package:ciland/features/movie_details/models/movie_details.dart';
import 'package:ciland/features/movie_details/models/person.dart';

class MovieDetails extends Film {
  final String originalTitle;
  final int? runtimeMinutes;
  final int? numVotes;
  final int? budget;
  final int? endYear;
  final String? language;
  final List<String> countriesOfOrigin;
  final List<String> spokenLanguages;
  final List<Person> directors;
  final List<Person> writers;
  final List<Person> cast;

  MovieDetails({
    required this.originalTitle,
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
    required super.primarytitle,
    required super.description,
    required super.primaryImage,
    required super.isAdult,
    required super.averageRating,
    required super.startYear,
    required super.genres,
    required super.movieType,
  });

  factory MovieDetails.fromModel(MovieDetailsModel model) {
    return MovieDetails(
      originalTitle: model.originalTitle,
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
      primarytitle: model.primaryTitle,
      description: model.description,
      primaryImage: model.primaryImage,
      isAdult: model.isAdult,
      averageRating: model.averageRating,
      startYear: model.startYear,
      endYear: model.endYear,
      genres: model.genres,
      movieType: model.type,
    );
  }

  String get duration => '$runtimeMinutes min';

  String get budgetUSD => '$budget\$';

}
