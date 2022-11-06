// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hike _$HikeFromJson(Map<String, dynamic> json) => Hike(
      id: json['id'] as String,
      descriptions: (json['descriptions'] as List<dynamic>)
          .map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      route: Route.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HikeToJson(Hike instance) => <String, dynamic>{
      'id': instance.id,
      'descriptions': instance.descriptions.map((e) => e.toJson()).toList(),
      'route': instance.route.toJson(),
    };
