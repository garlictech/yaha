// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_location.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $GeoLocation {
  const $GeoLocation();

  double get longitude;
  double get latitude;
  DateTime get timestamp;
  double get accuracy;
  double get altitude;
  double get altitudeAccuracy;
  double get heading;
  double get headingAccuracy;
  double get speed;
  double get speedAccuracy;

  GeoLocation copyWith({
    double? longitude,
    double? latitude,
    DateTime? timestamp,
    double? accuracy,
    double? altitude,
    double? altitudeAccuracy,
    double? heading,
    double? headingAccuracy,
    double? speed,
    double? speedAccuracy,
  }) =>
      GeoLocation(
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        timestamp: timestamp ?? this.timestamp,
        accuracy: accuracy ?? this.accuracy,
        altitude: altitude ?? this.altitude,
        altitudeAccuracy: altitudeAccuracy ?? this.altitudeAccuracy,
        heading: heading ?? this.heading,
        headingAccuracy: headingAccuracy ?? this.headingAccuracy,
        speed: speed ?? this.speed,
        speedAccuracy: speedAccuracy ?? this.speedAccuracy,
      );

  GeoLocation copyUsing(void Function(GeoLocation$Change change) mutator) {
    final change = GeoLocation$Change._(
      this.longitude,
      this.latitude,
      this.timestamp,
      this.accuracy,
      this.altitude,
      this.altitudeAccuracy,
      this.heading,
      this.headingAccuracy,
      this.speed,
      this.speedAccuracy,
    );
    mutator(change);
    return GeoLocation(
      longitude: change.longitude,
      latitude: change.latitude,
      timestamp: change.timestamp,
      accuracy: change.accuracy,
      altitude: change.altitude,
      altitudeAccuracy: change.altitudeAccuracy,
      heading: change.heading,
      headingAccuracy: change.headingAccuracy,
      speed: change.speed,
      speedAccuracy: change.speedAccuracy,
    );
  }

  @override
  String toString() =>
      "GeoLocation(longitude: $longitude, latitude: $latitude, timestamp: $timestamp, accuracy: $accuracy, altitude: $altitude, altitudeAccuracy: $altitudeAccuracy, heading: $heading, headingAccuracy: $headingAccuracy, speed: $speed, speedAccuracy: $speedAccuracy)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is GeoLocation &&
      other.runtimeType == runtimeType &&
      longitude == other.longitude &&
      latitude == other.latitude &&
      timestamp == other.timestamp &&
      accuracy == other.accuracy &&
      altitude == other.altitude &&
      altitudeAccuracy == other.altitudeAccuracy &&
      heading == other.heading &&
      headingAccuracy == other.headingAccuracy &&
      speed == other.speed &&
      speedAccuracy == other.speedAccuracy;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + longitude.hashCode;
    result = 37 * result + latitude.hashCode;
    result = 37 * result + timestamp.hashCode;
    result = 37 * result + accuracy.hashCode;
    result = 37 * result + altitude.hashCode;
    result = 37 * result + altitudeAccuracy.hashCode;
    result = 37 * result + heading.hashCode;
    result = 37 * result + headingAccuracy.hashCode;
    result = 37 * result + speed.hashCode;
    result = 37 * result + speedAccuracy.hashCode;
    return result;
  }
}

class GeoLocation$Change {
  GeoLocation$Change._(
    this.longitude,
    this.latitude,
    this.timestamp,
    this.accuracy,
    this.altitude,
    this.altitudeAccuracy,
    this.heading,
    this.headingAccuracy,
    this.speed,
    this.speedAccuracy,
  );

  double longitude;
  double latitude;
  DateTime timestamp;
  double accuracy;
  double altitude;
  double altitudeAccuracy;
  double heading;
  double headingAccuracy;
  double speed;
  double speedAccuracy;
}

// ignore: avoid_classes_with_only_static_members
class GeoLocation$ {
  static final longitude = Lens<GeoLocation, double>(
    (longitudeContainer) => longitudeContainer.longitude,
    (longitudeContainer, longitude) =>
        longitudeContainer.copyWith(longitude: longitude),
  );

  static final latitude = Lens<GeoLocation, double>(
    (latitudeContainer) => latitudeContainer.latitude,
    (latitudeContainer, latitude) =>
        latitudeContainer.copyWith(latitude: latitude),
  );

  static final timestamp = Lens<GeoLocation, DateTime>(
    (timestampContainer) => timestampContainer.timestamp,
    (timestampContainer, timestamp) =>
        timestampContainer.copyWith(timestamp: timestamp),
  );

  static final accuracy = Lens<GeoLocation, double>(
    (accuracyContainer) => accuracyContainer.accuracy,
    (accuracyContainer, accuracy) =>
        accuracyContainer.copyWith(accuracy: accuracy),
  );

  static final altitude = Lens<GeoLocation, double>(
    (altitudeContainer) => altitudeContainer.altitude,
    (altitudeContainer, altitude) =>
        altitudeContainer.copyWith(altitude: altitude),
  );

  static final altitudeAccuracy = Lens<GeoLocation, double>(
    (altitudeAccuracyContainer) => altitudeAccuracyContainer.altitudeAccuracy,
    (altitudeAccuracyContainer, altitudeAccuracy) =>
        altitudeAccuracyContainer.copyWith(altitudeAccuracy: altitudeAccuracy),
  );

  static final heading = Lens<GeoLocation, double>(
    (headingContainer) => headingContainer.heading,
    (headingContainer, heading) => headingContainer.copyWith(heading: heading),
  );

  static final headingAccuracy = Lens<GeoLocation, double>(
    (headingAccuracyContainer) => headingAccuracyContainer.headingAccuracy,
    (headingAccuracyContainer, headingAccuracy) =>
        headingAccuracyContainer.copyWith(headingAccuracy: headingAccuracy),
  );

  static final speed = Lens<GeoLocation, double>(
    (speedContainer) => speedContainer.speed,
    (speedContainer, speed) => speedContainer.copyWith(speed: speed),
  );

  static final speedAccuracy = Lens<GeoLocation, double>(
    (speedAccuracyContainer) => speedAccuracyContainer.speedAccuracy,
    (speedAccuracyContainer, speedAccuracy) =>
        speedAccuracyContainer.copyWith(speedAccuracy: speedAccuracy),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) => GeoLocation(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      accuracy: (json['accuracy'] as num).toDouble(),
      altitude: (json['altitude'] as num).toDouble(),
      altitudeAccuracy: (json['altitudeAccuracy'] as num).toDouble(),
      heading: (json['heading'] as num).toDouble(),
      headingAccuracy: (json['headingAccuracy'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
      speedAccuracy: (json['speedAccuracy'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoLocationToJson(GeoLocation instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'timestamp': instance.timestamp.toIso8601String(),
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'altitudeAccuracy': instance.altitudeAccuracy,
      'heading': instance.heading,
      'headingAccuracy': instance.headingAccuracy,
      'speed': instance.speed,
      'speedAccuracy': instance.speedAccuracy,
    };
