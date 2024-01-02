import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocationMappers {
  static GeoLocation fromPosition(Position position) => GeoLocation(
        longitude: position.longitude,
        latitude: position.latitude,
        timestamp: position.timestamp,
        accuracy: position.accuracy,
        altitude: position.altitude,
        altitudeAccuracy: position.altitudeAccuracy,
        heading: position.heading,
        headingAccuracy: position.headingAccuracy,
        speed: position.speed,
        speedAccuracy: position.speedAccuracy,
      );
}
