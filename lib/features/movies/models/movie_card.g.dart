// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieCardAdapter extends TypeAdapter<MovieCard> {
  @override
  final int typeId = 1;

  @override
  MovieCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieCard(
      id: fields[0] as String,
      primaryTitle: fields[1] as String,
      description: fields[3] as String,
      primaryImage: fields[4] as String,
      isAdult: fields[5] as bool,
      averageRating: fields[6] as double,
      startYear: fields[7] as int,
      genres: (fields[8] as List).cast<String>(),
      type: fields[9] as MovieType,
    );
  }

  @override
  void write(BinaryWriter writer, MovieCard obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.primaryTitle)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.primaryImage)
      ..writeByte(5)
      ..write(obj.isAdult)
      ..writeByte(6)
      ..write(obj.averageRating)
      ..writeByte(7)
      ..write(obj.startYear)
      ..writeByte(8)
      ..write(obj.genres)
      ..writeByte(9)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCard _$MovieCardFromJson(Map<String, dynamic> json) => MovieCard(
      id: json['id'] as String? ?? '',
      primaryTitle: json['primaryTitle'] as String? ?? '',
      description: json['description'] as String? ?? '',
      primaryImage: json['primaryImage'] as String? ?? '',
      isAdult: json['isAdult'] as bool? ?? false,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      startYear: (json['startYear'] as num?)?.toInt() ?? 0,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      type: $enumDecodeNullable(_$MovieTypeEnumMap, json['type'],
              unknownValue: MovieType.movie) ??
          MovieType.movie,
    );

Map<String, dynamic> _$MovieCardToJson(MovieCard instance) => <String, dynamic>{
      'id': instance.id,
      'primaryTitle': instance.primaryTitle,
      'description': instance.description,
      'primaryImage': instance.primaryImage,
      'isAdult': instance.isAdult,
      'averageRating': instance.averageRating,
      'startYear': instance.startYear,
      'genres': instance.genres,
      'type': _$MovieTypeEnumMap[instance.type]!,
    };

const _$MovieTypeEnumMap = {
  MovieType.movie: 'movie',
  MovieType.tvSeries: 'tvSeries',
};
