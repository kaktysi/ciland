// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      originalTitle: json['originalTitle'] as String? ?? '',
      runtimeMinutes: (json['runtimeMinutes'] as num?)?.toInt(),
      numVotes: (json['numVotes'] as num?)?.toInt(),
      language: json['language'] as String?,
      budget: (json['budget'] as num?)?.toInt(),
      endYear: (json['endYear'] as num?)?.toInt(),
      countriesOfOrigin:
          (json['countriesOfOrigin'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      spokenLanguages:
          (json['spokenLanguages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      directors:
          (json['directors'] as List<dynamic>?)
              ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      writers:
          (json['writers'] as List<dynamic>?)
              ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      cast:
          (json['cast'] as List<dynamic>?)
              ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String? ?? '',
      primaryTitle: json['primaryTitle'] as String? ?? '',
      description: json['description'] as String? ?? '',
      primaryImage: json['primaryImage'] as String? ?? '',
      isAdult: json['isAdult'] as bool? ?? false,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      startYear: (json['startYear'] as num?)?.toInt() ?? 0,
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      type:
          $enumDecodeNullable(
            _$MovieTypeEnumMap,
            json['type'],
            unknownValue: MovieType.movie,
          ) ??
          MovieType.movie,
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'primaryTitle': instance.primaryTitle,
      'description': instance.description,
      'primaryImage': instance.primaryImage,
      'isAdult': instance.isAdult,
      'averageRating': instance.averageRating,
      'startYear': instance.startYear,
      'genres': instance.genres,
      'type': _$MovieTypeEnumMap[instance.type]!,
      'originalTitle': instance.originalTitle,
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

const _$MovieTypeEnumMap = {
  MovieType.movie: 'movie',
  MovieType.tvSeries: 'tvSeries',
};
