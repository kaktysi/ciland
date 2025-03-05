// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmCard _$FilmCardFromJson(Map<String, dynamic> json) => FilmCard(
  id: json['id'] as String? ?? '',
  originalTitle: json['originalTitle'] as String? ?? '',
  description: json['description'] as String? ?? '',
  primaryImage: json['primaryImage'] as String? ?? '',
  isAdult: json['isAdult'] as bool? ?? false,
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
  startYear: (json['startYear'] as num?)?.toInt() ?? 0,
  genre:
      (json['genre'] as List<dynamic>?)
          ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$FilmCardToJson(FilmCard instance) => <String, dynamic>{
  'id': instance.id,
  'originalTitle': instance.originalTitle,
  'description': instance.description,
  'primaryImage': instance.primaryImage,
  'isAdult': instance.isAdult,
  'averageRating': instance.averageRating,
  'startYear': instance.startYear,
  'genre': instance.genre,
};
