// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Waypoint {
  const $Waypoint();

  Point get location;

  Waypoint copyWith({
    Point? location,
  }) =>
      Waypoint(
        location: location ?? this.location,
      );

  Waypoint copyUsing(void Function(Waypoint$Change change) mutator) {
    final change = Waypoint$Change._(
      this.location,
    );
    mutator(change);
    return Waypoint(
      location: change.location,
    );
  }

  @override
  String toString() => "Waypoint(location: $location)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Waypoint &&
      other.runtimeType == runtimeType &&
      location == other.location;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return location.hashCode;
  }
}

class Waypoint$Change {
  Waypoint$Change._(
    this.location,
  );

  Point location;
}

// ignore: avoid_classes_with_only_static_members
class Waypoint$ {
  static final location = Lens<Waypoint, Point>(
    (locationContainer) => locationContainer.location,
    (locationContainer, location) =>
        locationContainer.copyWith(location: location),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Waypoint _$WaypointFromJson(Map<String, dynamic> json) => Waypoint(
      location: Point.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WaypointToJson(Waypoint instance) => <String, dynamic>{
      'location': instance.location.toJson(),
    };
