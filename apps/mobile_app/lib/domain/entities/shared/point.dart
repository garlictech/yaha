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

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}
