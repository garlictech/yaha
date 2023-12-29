import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';
import './geo_point.dart';

part 'waypoint.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class Waypoint extends $Waypoint {
  @override
  final GeoPoint location;

  const Waypoint({
    required this.location,
  });

  factory Waypoint.fromJson(Map<String, dynamic> json) =>
      _$WaypointFromJson(json);

  Map<String, dynamic> toJson() => _$WaypointToJson(this);
}
