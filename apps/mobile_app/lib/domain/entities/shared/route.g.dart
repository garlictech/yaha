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
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      municipality: json['municipality'] as String?,
    );

Map<String, dynamic> _$RouteToJson(Route instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'coordinates': instance.coordinates.map((e) => e.toJson()).toList(),
    'images': instance.images.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('municipality', instance.municipality);
  return val;
}
