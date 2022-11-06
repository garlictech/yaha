// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounding_box.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $BoundingBox {
  const $BoundingBox();

  Location get SouthWest;
  Location get NorthEast;

  BoundingBox copyWith({
    Location? SouthWest,
    Location? NorthEast,
  }) =>
      BoundingBox(
        SouthWest: SouthWest ?? this.SouthWest,
        NorthEast: NorthEast ?? this.NorthEast,
      );

  BoundingBox copyUsing(void Function(BoundingBox$Change change) mutator) {
    final change = BoundingBox$Change._(
      this.SouthWest,
      this.NorthEast,
    );
    mutator(change);
    return BoundingBox(
      SouthWest: change.SouthWest,
      NorthEast: change.NorthEast,
    );
  }

  @override
  String toString() =>
      "BoundingBox(SouthWest: $SouthWest, NorthEast: $NorthEast)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is BoundingBox &&
      other.runtimeType == runtimeType &&
      SouthWest == other.SouthWest &&
      NorthEast == other.NorthEast;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + SouthWest.hashCode;
    result = 37 * result + NorthEast.hashCode;
    return result;
  }
}

class BoundingBox$Change {
  BoundingBox$Change._(
    this.SouthWest,
    this.NorthEast,
  );

  Location SouthWest;
  Location NorthEast;
}

// ignore: avoid_classes_with_only_static_members
class BoundingBox$ {
  static final SouthWest = Lens<BoundingBox, Location>(
    (SouthWestContainer) => SouthWestContainer.SouthWest,
    (SouthWestContainer, SouthWest) =>
        SouthWestContainer.copyWith(SouthWest: SouthWest),
  );

  static final NorthEast = Lens<BoundingBox, Location>(
    (NorthEastContainer) => NorthEastContainer.NorthEast,
    (NorthEastContainer, NorthEast) =>
        NorthEastContainer.copyWith(NorthEast: NorthEast),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoundingBox _$BoundingBoxFromJson(Map<String, dynamic> json) => BoundingBox(
      SouthWest: Location.fromJson(json['SouthWest'] as Map<String, dynamic>),
      NorthEast: Location.fromJson(json['NorthEast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoundingBoxToJson(BoundingBox instance) =>
    <String, dynamic>{
      'SouthWest': instance.SouthWest.toJson(),
      'NorthEast': instance.NorthEast.toJson(),
    };
