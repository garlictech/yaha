import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo_location.g.dart';

@FunctionalData()
@JsonSerializable()
class GeoLocation extends $GeoLocation {
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final DateTime timestamp;
  @override
  final double accuracy;
  @override
  final double altitude;
  @override
  final double altitudeAccuracy;
  @override
  final double heading;
  @override
  final double headingAccuracy;
  @override
  final double speed;
  @override
  final double speedAccuracy;

  const GeoLocation(
      {required this.longitude,
      required this.latitude,
      required this.timestamp,
      required this.accuracy,
      required this.altitude,
      required this.altitudeAccuracy,
      required this.heading,
      required this.headingAccuracy,
      required this.speed,
      required this.speedAccuracy});

  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);

  Map<String, dynamic> toJson() => _$GeoLocationToJson(this);
}
