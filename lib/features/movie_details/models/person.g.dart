// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
  json['job'] as String?,
  id: json['id'] as String? ?? '',
  fullName: json['fullName'] as String? ?? '',
);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'job': instance.job,
};
