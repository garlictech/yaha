// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hike _$HikeFromJson(Map<String, dynamic> json) => Hike(
      id: json['id'] as String,
      description: (json['description'] as List<dynamic>)
          .map((e) => TextualDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      route: LineStringData.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HikeToJson(Hike instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'route': instance.route,
    };
