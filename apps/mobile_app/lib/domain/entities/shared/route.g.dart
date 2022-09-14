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
      onroutePois: (json['onroutePois'] as List<dynamic>)
          .map((e) => Poi.fromJson(e as Map<String, dynamic>))
          .toList(),
      offroutePois: (json['offroutePois'] as List<dynamic>)
          .map((e) => Poi.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'id': instance.id,
      'coordinates': instance.coordinates.map((e) => e.toJson()).toList(),
      'onroutePois': instance.onroutePois.map((e) => e.toJson()).toList(),
      'offroutePois': instance.offroutePois.map((e) => e.toJson()).toList(),
      'images': instance.images.map((e) => e.toJson()).toList(),
    };
