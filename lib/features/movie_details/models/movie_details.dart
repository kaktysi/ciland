import 'package:ciland/features/films/models/film_card.dart';
import 'package:ciland/features/films/models/movie_type.dart';
import 'package:ciland/features/movie_details/models/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetailsModel extends FilmCard {
  @JsonKey(defaultValue: '')
  final String originalTitle;
  final int? runtimeMinutes;
  final int? numVotes;
  final int? budget;
  final int? endYear;
  final String? language;
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

  MovieDetailsModel({
    required this.originalTitle,
    this.runtimeMinutes,
    this.numVotes,
    this.language,
    this.budget,
    this.endYear,
    required this.countriesOfOrigin,
    required this.spokenLanguages,
    required this.directors,
    required this.writers,
    required this.cast,
    required super.id,
    required super.primaryTitle,
    required super.description,
    required super.primaryImage,
    required super.isAdult,
    required super.averageRating,
    required super.startYear,
    required super.genres,
    required super.type,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
