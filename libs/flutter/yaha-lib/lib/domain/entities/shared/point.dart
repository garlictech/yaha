import 'dart:convert';

import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'point.g.dart';

@FunctionalData()
@JsonSerializable()
class Point extends $Point {
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double height;

  const Point({
    required this.latitude,
    required this.longitude,
    required this.height,
  });

  get asGeojsonPoint => [longitude, latitude, height];
  get asLatLon => {"lon": longitude, "lat": latitude, "elevation": height};

  get asGeojsonPointJsonStr => jsonEncode([longitude, latitude, height]);

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}
