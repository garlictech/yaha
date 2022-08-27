import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'waypoint.g.dart';

@FunctionalData()
@JsonSerializable()
class Waypoint extends $Waypoint {
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double height;

  const Waypoint({
    required this.latitude,
    required this.longitude,
    required this.height,
  });

  factory Waypoint.fromJson(Map<String, dynamic> json) =>
      _$WaypointFromJson(json);

  Map<String, dynamic> toJson() => _$WaypointToJson(this);
}
