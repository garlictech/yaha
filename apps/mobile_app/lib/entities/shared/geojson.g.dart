// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $GeoJsonData {
  const $GeoJsonData();

  String get type;
  List<List<List<double>>> get coordinates;

  GeoJsonData copyWith({
    String? type,
    List<List<List<double>>>? coordinates,
  }) =>
      GeoJsonData(
        type: type ?? this.type,
        coordinates: coordinates ?? this.coordinates,
      );

  GeoJsonData copyUsing(void Function(GeoJsonData$Change change) mutator) {
    final change = GeoJsonData$Change._(
      this.type,
      this.coordinates,
    );
    mutator(change);
    return GeoJsonData(
      type: change.type,
      coordinates: change.coordinates,
    );
  }

  @override
  String toString() => "GeoJsonData(type: $type, coordinates: $coordinates)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is GeoJsonData &&
      other.runtimeType == runtimeType &&
      type == other.type &&
      coordinates == other.coordinates;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + type.hashCode;
    result = 37 * result + coordinates.hashCode;
    return result;
  }
}

class GeoJsonData$Change {
  GeoJsonData$Change._(
    this.type,
    this.coordinates,
  );

  String type;
  List<List<List<double>>> coordinates;
}

// ignore: avoid_classes_with_only_static_members
class GeoJsonData$ {
  static final type = Lens<GeoJsonData, String>(
    (typeContainer) => typeContainer.type,
    (typeContainer, type) => typeContainer.copyWith(type: type),
  );

  static final coordinates = Lens<GeoJsonData, List<List<List<double>>>>(
    (coordinatesContainer) => coordinatesContainer.coordinates,
    (coordinatesContainer, coordinates) =>
        coordinatesContainer.copyWith(coordinates: coordinates),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonData _$GeoJsonDataFromJson(Map<String, dynamic> json) => GeoJsonData(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GeoJsonDataToJson(GeoJsonData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
