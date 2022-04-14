// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poi _$PoiFromJson(Map<String, dynamic> json) => Poi(
      id: json['id'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      elevation: (json['elevation'] as num?)?.toDouble(),
      type: json['type'] as String? ?? "generic:unknown",
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => TextualDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      openingHours: json['openingHours'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PoiToJson(Poi instance) => <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'elevation': instance.elevation,
      'type': instance.type,
      'description': instance.description,
      'tags': instance.tags,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'openingHours': instance.openingHours,
    };
