import 'package:ciland/features/films/models/film_card.dart';
import 'package:ciland/features/movie_details/models/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetailsModel extends FilmCard {
  @JsonKey(defaultValue: 0)
  final int runtimeMinutes;
  @JsonKey(defaultValue: 0)
  final int numVotes;
  @JsonKey(defaultValue: 0)
  final int budget;
  final int? endYear;
  @JsonKey(defaultValue: '')
  final String language;
  @JsonKey(defaultValue: [])
  final List<String> countriesOfOrigin;
  @JsonKey(defaultValue: [])
  final List<String> spokenLanguages;
  @JsonKey(defaultValue: [])
  final List<Person> directors;
  @JsonKey(defaultValue: [])
  final List<Person> writers;
  @JsonKey(defaultValue: [])
  final List<Person> cast;

  MovieDetailsModel(
    this.runtimeMinutes,
    this.numVotes,
    this.language,
    this.budget,
    this.endYear,
    this.countriesOfOrigin,
    this.spokenLanguages,
    this.directors,
    this.writers,
    this.cast, {
    required super.id,
    required super.originalTitle,
    required super.description,
    required super.primaryImage,
    required super.isAdult,
    required super.averageRating,
    required super.startYear,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
