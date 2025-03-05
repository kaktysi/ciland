import 'package:ciland/features/films/models/genre_model.dart';

class Genre {
  Genre({required this.name});

  final String name;

  factory Genre.fromModel(GenreModel model) {
    return Genre(name: model.name);
  }
}
