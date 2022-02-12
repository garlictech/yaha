// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $GeoJson {
  const $GeoJson();

  String get type;
  List<List<List<double>>> get coordinates;

  GeoJson copyWith({
    String? type,
    List<List<List<double>>>? coordinates,
  }) =>
      GeoJson(
        type: type ?? this.type,
        coordinates: coordinates ?? this.coordinates,
      );

  GeoJson copyUsing(void Function(GeoJson$Change change) mutator) {
    final change = GeoJson$Change._(
      this.type,
      this.coordinates,
    );
    mutator(change);
    return GeoJson(
      type: change.type,
      coordinates: change.coordinates,
    );
  }

  @override
  String toString() => "GeoJson(type: $type, coordinates: $coordinates)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is GeoJson &&
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

class GeoJson$Change {
  GeoJson$Change._(
    this.type,
    this.coordinates,
  );

  String type;
  List<List<List<double>>> coordinates;
}

// ignore: avoid_classes_with_only_static_members
class GeoJson$ {
  static final type = Lens<GeoJson, String>(
    (typeContainer) => typeContainer.type,
    (typeContainer, type) => typeContainer.copyWith(type: type),
  );

  static final coordinates = Lens<GeoJson, List<List<List<double>>>>(
    (coordinatesContainer) => coordinatesContainer.coordinates,
    (coordinatesContainer, coordinates) =>
        coordinatesContainer.copyWith(coordinates: coordinates),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJson _$GeoJsonFromJson(Map<String, dynamic> json) => GeoJson(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GeoJsonToJson(GeoJson instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
