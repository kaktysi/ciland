import 'package:ciland/app_config.dart';
import 'package:ciland/features/movies/models/movie_type.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_card.g.dart';

@JsonSerializable()
@HiveType(typeId: AppConfig.movieHiveTypeId)
class MovieCard {
  @JsonKey(defaultValue: '')
  @HiveField(0)
  final String id;
  @HiveField(1)
  @JsonKey(defaultValue: '')
  @HiveField(2)
  final String primaryTitle;
  @JsonKey(defaultValue: '')
  @HiveField(3)
  final String description;
  @JsonKey(defaultValue: '')
  @HiveField(4)
  final String primaryImage;
  @JsonKey(defaultValue: false)
  @HiveField(5)
  final bool isAdult;
  @JsonKey(defaultValue: 0.0)
  @HiveField(6)
  final double averageRating;
  @JsonKey(defaultValue: 0)
  @HiveField(7)
  final int startYear;
  @JsonKey(defaultValue: <String>[])
  @HiveField(8)
  final List<String> genres;
  @JsonKey(unknownEnumValue: MovieType.movie, defaultValue: MovieType.movie)
  @HiveField(9)
  final MovieType type;

  MovieCard({
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

  factory MovieCard.fromJson(Map<String, dynamic> json) =>
      _$MovieCardFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCardToJson(this);
}
