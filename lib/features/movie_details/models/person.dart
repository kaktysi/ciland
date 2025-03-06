import 'package:json_annotation/json_annotation.dart';
part 'person.g.dart';

@JsonSerializable()
class Person {
  Person(this.job, {required this.id, required this.fullName});

  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String fullName;
  final String? job;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
