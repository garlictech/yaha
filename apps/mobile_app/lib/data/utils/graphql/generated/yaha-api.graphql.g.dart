// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'yaha-api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoSearchConnection _$GeoSearchConnectionFromJson(Map<String, dynamic> json) =>
    GeoSearchConnection()
      ..items =
          (json['items'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..nextToken = json['nextToken'] as String?
      ..total = json['total'] as int?;

Map<String, dynamic> _$GeoSearchConnectionToJson(
        GeoSearchConnection instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextToken': instance.nextToken,
      'total': instance.total,
    };

SearchAroundHike$Query _$SearchAroundHike$QueryFromJson(
        Map<String, dynamic> json) =>
    SearchAroundHike$Query()
      ..searchAroundHike = json['searchAroundHike'] == null
          ? null
          : GeoSearchConnection.fromJson(
              json['searchAroundHike'] as Map<String, dynamic>);

Map<String, dynamic> _$SearchAroundHike$QueryToJson(
        SearchAroundHike$Query instance) =>
    <String, dynamic>{
      'searchAroundHike': instance.searchAroundHike?.toJson(),
    };

SearchAroundHikeInput _$SearchAroundHikeInputFromJson(
        Map<String, dynamic> json) =>
    SearchAroundHikeInput(
      hikeId: json['hikeId'] as String,
      distanceInMeters: (json['distanceInMeters'] as num).toDouble(),
      objectType: $enumDecode(
          _$GeoSearchableObjectTypeEnumMap, json['objectType'],
          unknownValue: GeoSearchableObjectType.artemisUnknown),
      limit: json['limit'] as int?,
      nextToken: json['nextToken'] as String?,
    );

Map<String, dynamic> _$SearchAroundHikeInputToJson(
        SearchAroundHikeInput instance) =>
    <String, dynamic>{
      'hikeId': instance.hikeId,
      'distanceInMeters': instance.distanceInMeters,
      'objectType': _$GeoSearchableObjectTypeEnumMap[instance.objectType],
      'limit': instance.limit,
      'nextToken': instance.nextToken,
    };

const _$GeoSearchableObjectTypeEnumMap = {
  GeoSearchableObjectType.poi: 'poi',
  GeoSearchableObjectType.hike: 'hike',
  GeoSearchableObjectType.image: 'image',
  GeoSearchableObjectType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

SearchAroundHikeArguments _$SearchAroundHikeArgumentsFromJson(
        Map<String, dynamic> json) =>
    SearchAroundHikeArguments(
      query:
          SearchAroundHikeInput.fromJson(json['query'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchAroundHikeArgumentsToJson(
        SearchAroundHikeArguments instance) =>
    <String, dynamic>{
      'query': instance.query.toJson(),
    };
