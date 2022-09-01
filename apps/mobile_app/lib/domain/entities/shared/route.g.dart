// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      id: json['id'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => Waypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      startPoint: Waypoint.fromJson(json['startPoint'] as Map<String, dynamic>),
      endPoint: Waypoint.fromJson(json['endPoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'id': instance.id,
      'coordinates': instance.coordinates.map((e) => e.toJson()).toList(),
      'startPoint': instance.startPoint.toJson(),
      'endPoint': instance.endPoint.toJson(),
    };
