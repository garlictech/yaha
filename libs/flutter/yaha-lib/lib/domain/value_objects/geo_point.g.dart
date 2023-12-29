// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $GeoPoint {
  const $GeoPoint();

  double get latitude;
  double get longitude;
  double get height;

  GeoPoint copyWith({
    double? latitude,
    double? longitude,
    double? height,
  }) =>
      GeoPoint(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        height: height ?? this.height,
      );

  GeoPoint copyUsing(void Function(GeoPoint$Change change) mutator) {
    final change = GeoPoint$Change._(
      this.latitude,
      this.longitude,
      this.height,
    );
    mutator(change);
    return GeoPoint(
      latitude: change.latitude,
      longitude: change.longitude,
      height: change.height,
    );
  }

  @override
  String toString() =>
      "GeoPoint(latitude: $latitude, longitude: $longitude, height: $height)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is GeoPoint &&
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

class GeoPoint$Change {
  GeoPoint$Change._(
    this.latitude,
    this.longitude,
    this.height,
  );

  double latitude;
  double longitude;
  double height;
}

// ignore: avoid_classes_with_only_static_members
class GeoPoint$ {
  static final latitude = Lens<GeoPoint, double>(
    (latitudeContainer) => latitudeContainer.latitude,
    (latitudeContainer, latitude) =>
        latitudeContainer.copyWith(latitude: latitude),
  );

  static final longitude = Lens<GeoPoint, double>(
    (longitudeContainer) => longitudeContainer.longitude,
    (longitudeContainer, longitude) =>
        longitudeContainer.copyWith(longitude: longitude),
  );

  static final height = Lens<GeoPoint, double>(
    (heightContainer) => heightContainer.height,
    (heightContainer, height) => heightContainer.copyWith(height: height),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoPoint _$GeoPointFromJson(Map<String, dynamic> json) => GeoPoint(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoPointToJson(GeoPoint instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'height': instance.height,
    };
