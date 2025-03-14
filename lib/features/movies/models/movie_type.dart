import 'package:ciland/app_config.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum MovieType {
  movie,
  tvSeries;

  bool get isMovie => this == MovieType.movie;

  String get name => isMovie ? 'movie' : 'tvSeries';
}

class MovieTypeAdapter extends TypeAdapter<MovieType> {
  @override
  final int typeId = AppConfig.movieTypeHiveTypeId;

  @override
  MovieType read(BinaryReader reader) {
    return MovieType.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, MovieType obj) {
    writer.writeInt(obj.index);
  }
}
