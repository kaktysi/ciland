import 'package:ciland/features/films/models/movie_type.dart';
import 'package:json_annotation/json_annotation.dart';
part 'film_card.g.dart';

@JsonSerializable()
class FilmCard {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String primaryTitle;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String primaryImage;
  @JsonKey(defaultValue: false)
  final bool isAdult;
  @JsonKey(defaultValue: 0.0)
  final double averageRating;
  @JsonKey(defaultValue: 0)
  final int startYear;
  @JsonKey(defaultValue: <String>[])
  final List<String> genres;
  @JsonKey(unknownEnumValue: MovieType.movie, defaultValue: MovieType.movie)
  final MovieType type;

  FilmCard({
    required this.id,
    required this.primaryTitle,
    required this.description,
    required this.primaryImage,
    required this.isAdult,
    required this.averageRating,
    required this.startYear,
    required this.genres,
    required this.type,
  });

  factory FilmCard.fromJson(Map<String, dynamic> json) =>
      _$FilmCardFromJson(json);

  Map<String, dynamic> toJson() => _$FilmCardToJson(this);
}
