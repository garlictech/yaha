// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linestring.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $LineStringData {
  const $LineStringData();

  String get type;
  List<List<double>> get coordinates;

  LineStringData copyWith({
    String? type,
    List<List<double>>? coordinates,
  }) =>
      LineStringData(
        type: type ?? this.type,
        coordinates: coordinates ?? this.coordinates,
      );

  LineStringData copyUsing(
      void Function(LineStringData$Change change) mutator) {
    final change = LineStringData$Change._(
      this.type,
      this.coordinates,
    );
    mutator(change);
    return LineStringData(
      type: change.type,
      coordinates: change.coordinates,
    );
  }

  @override
  String toString() => "LineStringData(type: $type, coordinates: $coordinates)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is LineStringData &&
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

class LineStringData$Change {
  LineStringData$Change._(
    this.type,
    this.coordinates,
  );

  String type;
  List<List<double>> coordinates;
}

// ignore: avoid_classes_with_only_static_members
class LineStringData$ {
  static final type = Lens<LineStringData, String>(
    (typeContainer) => typeContainer.type,
    (typeContainer, type) => typeContainer.copyWith(type: type),
  );

  static final coordinates = Lens<LineStringData, List<List<double>>>(
    (coordinatesContainer) => coordinatesContainer.coordinates,
    (coordinatesContainer, coordinates) =>
        coordinatesContainer.copyWith(coordinates: coordinates),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineStringData _$LineStringDataFromJson(Map<String, dynamic> json) =>
    LineStringData(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$LineStringDataToJson(LineStringData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
