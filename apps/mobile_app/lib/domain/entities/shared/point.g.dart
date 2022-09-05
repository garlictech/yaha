// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Point {
  const $Point();

  double get latitude;
  double get longitude;
  double get height;

  Point copyWith({
    double? latitude,
    double? longitude,
    double? height,
  }) =>
      Point(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        height: height ?? this.height,
      );

  Point copyUsing(void Function(Point$Change change) mutator) {
    final change = Point$Change._(
      this.latitude,
      this.longitude,
      this.height,
    );
    mutator(change);
    return Point(
      latitude: change.latitude,
      longitude: change.longitude,
      height: change.height,
    );
  }

  @override
  String toString() =>
      "Point(latitude: $latitude, longitude: $longitude, height: $height)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Point &&
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

class Point$Change {
  Point$Change._(
    this.latitude,
    this.longitude,
    this.height,
  );

  double latitude;
  double longitude;
  double height;
}

// ignore: avoid_classes_with_only_static_members
class Point$ {
  static final latitude = Lens<Point, double>(
    (latitudeContainer) => latitudeContainer.latitude,
    (latitudeContainer, latitude) =>
        latitudeContainer.copyWith(latitude: latitude),
  );

  static final longitude = Lens<Point, double>(
    (longitudeContainer) => longitudeContainer.longitude,
    (longitudeContainer, longitude) =>
        longitudeContainer.copyWith(longitude: longitude),
  );

  static final height = Lens<Point, double>(
    (heightContainer) => heightContainer.height,
    (heightContainer, height) => heightContainer.copyWith(height: height),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<String, dynamic> json) => Point(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'height': instance.height,
    };
