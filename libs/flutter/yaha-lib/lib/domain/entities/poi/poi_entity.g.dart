// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoiEntity _$PoiEntityFromJson(Map<String, dynamic> json) => PoiEntity(
      id: json['id'] as String,
      type: json['type'] as String? ?? "generic:unknown",
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      openingHours: json['openingHours'] as String?,
      phone: json['phone'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      address: json['address'] as String?,
      infoUrl: json['infoUrl'] as String?,
      location: Waypoint.fromJson(json['location'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    ).._poiType = json['_poiType'] == null
        ? null
        : PoiType.fromJson(json['_poiType'] as Map<String, dynamic>);

Map<String, dynamic> _$PoiEntityToJson(PoiEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'descriptions', instance.descriptions?.map((e) => e.toJson()).toList());
  writeNotNull('tags', instance.tags);
  writeNotNull('address', instance.address);
  writeNotNull('phone', instance.phone);
  writeNotNull('openingHours', instance.openingHours);
  writeNotNull('infoUrl', instance.infoUrl);
  val['images'] = instance.images.map((e) => e.toJson()).toList();
  val['location'] = instance.location.toJson();
  writeNotNull('_poiType', instance._poiType?.toJson());
  return val;
}
