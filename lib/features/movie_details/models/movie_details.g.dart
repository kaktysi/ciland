// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetailsModel(
  (json['runtimeMinutes'] as num?)?.toInt() ?? 0,
  (json['numVotes'] as num?)?.toInt() ?? 0,
  json['language'] as String? ?? '',
  (json['budget'] as num?)?.toInt() ?? 0,
  (json['endYear'] as num?)?.toInt(),
  (json['countriesOfOrigin'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  (json['spokenLanguages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  (json['directors'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  (json['writers'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  (json['cast'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  id: json['id'] as String? ?? '',
  originalTitle: json['originalTitle'] as String? ?? '',
  description: json['description'] as String? ?? '',
  primaryImage: json['primaryImage'] as String? ?? '',
  isAdult: json['isAdult'] as bool? ?? false,
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
  startYear: (json['startYear'] as num?)?.toInt() ?? 0,
  genres:
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
);

Map<String, dynamic> _$MovieDetailsToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalTitle': instance.originalTitle,
      'description': instance.description,
      'primaryImage': instance.primaryImage,
      'isAdult': instance.isAdult,
      'averageRating': instance.averageRating,
      'startYear': instance.startYear,
      'genres': instance.genres,
      'runtimeMinutes': instance.runtimeMinutes,
      'numVotes': instance.numVotes,
      'budget': instance.budget,
      'endYear': instance.endYear,
      'language': instance.language,
      'countriesOfOrigin': instance.countriesOfOrigin,
      'spokenLanguages': instance.spokenLanguages,
      'directors': instance.directors,
      'writers': instance.writers,
      'cast': instance.cast,
    };
