// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounding_box.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $BoundingBox {
  const $BoundingBox();

  Location get southWest;
  Location get northEast;

  BoundingBox copyWith({
    Location? southWest,
    Location? northEast,
  }) =>
      BoundingBox(
        southWest: southWest ?? this.southWest,
        northEast: northEast ?? this.northEast,
      );

  BoundingBox copyUsing(void Function(BoundingBox$Change change) mutator) {
    final change = BoundingBox$Change._(
      this.southWest,
      this.northEast,
    );
    mutator(change);
    return BoundingBox(
      southWest: change.southWest,
      northEast: change.northEast,
    );
  }

  @override
  String toString() =>
      "BoundingBox(southWest: $southWest, northEast: $northEast)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is BoundingBox &&
      other.runtimeType == runtimeType &&
      southWest == other.southWest &&
      northEast == other.northEast;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + southWest.hashCode;
    result = 37 * result + northEast.hashCode;
    return result;
  }
}

class BoundingBox$Change {
  BoundingBox$Change._(
    this.southWest,
    this.northEast,
  );

  Location southWest;
  Location northEast;
}

// ignore: avoid_classes_with_only_static_members
class BoundingBox$ {
  static final southWest = Lens<BoundingBox, Location>(
    (southWestContainer) => southWestContainer.southWest,
    (southWestContainer, southWest) =>
        southWestContainer.copyWith(southWest: southWest),
  );

  static final northEast = Lens<BoundingBox, Location>(
    (northEastContainer) => northEastContainer.northEast,
    (northEastContainer, northEast) =>
        northEastContainer.copyWith(northEast: northEast),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoundingBox _$BoundingBoxFromJson(Map<String, dynamic> json) => BoundingBox(
      southWest: Location.fromJson(json['southWest'] as Map<String, dynamic>),
      northEast: Location.fromJson(json['northEast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoundingBoxToJson(BoundingBox instance) =>
    <String, dynamic>{
      'southWest': instance.southWest.toJson(),
      'northEast': instance.northEast.toJson(),
    };
