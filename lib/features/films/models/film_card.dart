import 'package:json_annotation/json_annotation.dart';
part 'film_card.g.dart';

@JsonSerializable()
class FilmCard {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String originalTitle;
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

  FilmCard({
    required this.id,
    required this.originalTitle,
    required this.description,
    required this.primaryImage,
    required this.isAdult,
    required this.averageRating,
    required this.startYear,
    required this.genres,
  });

  factory FilmCard.fromJson(Map<String, dynamic> json) =>
      _$FilmCardFromJson(json);

  Map<String, dynamic> toJson() => _$FilmCardToJson(this);
}
