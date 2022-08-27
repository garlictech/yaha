// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Waypoint {
  const $Waypoint();

  double get latitude;
  double get longitude;
  double get height;

  Waypoint copyWith({
    double? latitude,
    double? longitude,
    double? height,
  }) =>
      Waypoint(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        height: height ?? this.height,
      );

  Waypoint copyUsing(void Function(Waypoint$Change change) mutator) {
    final change = Waypoint$Change._(
      this.latitude,
      this.longitude,
      this.height,
    );
    mutator(change);
    return Waypoint(
      latitude: change.latitude,
      longitude: change.longitude,
      height: change.height,
    );
  }

  @override
  String toString() =>
      "Waypoint(latitude: $latitude, longitude: $longitude, height: $height)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Waypoint &&
      other.runtimeType == runtimeType &&
      latitude == other.latitude &&
      longitude == other.longitude &&
      height == other.height;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + latitude.hashCode;
    result = 37 * result + longitude.hashCode;
    result = 37 * result + height.hashCode;
    return result;
  }
}

class Waypoint$Change {
  Waypoint$Change._(
    this.latitude,
    this.longitude,
    this.height,
  );

  double latitude;
  double longitude;
  double height;
}

// ignore: avoid_classes_with_only_static_members
class Waypoint$ {
  static final latitude = Lens<Waypoint, double>(
    (latitudeContainer) => latitudeContainer.latitude,
    (latitudeContainer, latitude) =>
        latitudeContainer.copyWith(latitude: latitude),
  );

  static final longitude = Lens<Waypoint, double>(
    (longitudeContainer) => longitudeContainer.longitude,
    (longitudeContainer, longitude) =>
        longitudeContainer.copyWith(longitude: longitude),
  );

  static final height = Lens<Waypoint, double>(
    (heightContainer) => heightContainer.height,
    (heightContainer, height) => heightContainer.copyWith(height: height),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Waypoint _$WaypointFromJson(Map<String, dynamic> json) => Waypoint(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$WaypointToJson(Waypoint instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'height': instance.height,
    };
