import 'dart:convert';

import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo_point.g.dart';

@FunctionalData()
@JsonSerializable()
class GeoPoint extends $GeoPoint {
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double height;

  const GeoPoint({
    required this.latitude,
    required this.longitude,
    required this.height,
  });

  get asGeojsonPoint => [longitude, latitude, height];
  get asLatLon => {"lon": longitude, "lat": latitude, "elevation": height};

  get asGeojsonPointJsonStr => jsonEncode([longitude, latitude, height]);

  factory GeoPoint.fromJson(Map<String, dynamic> json) =>
      _$GeoPointFromJson(json);

  Map<String, dynamic> toJson() => _$GeoPointToJson(this);
}
