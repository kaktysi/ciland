import 'package:json_annotation/json_annotation.dart';
part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel {
  GenreModel({required this.name});

  @JsonKey(defaultValue: '')
  final String name;

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
