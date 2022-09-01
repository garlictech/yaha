import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/domain/domain.dart';

part 'route.g.dart';

@JsonSerializable(explicitToJson: true)
class Route {
  final String id;
  final List<Waypoint> coordinates;
  final Waypoint startPoint;
  final Waypoint endPoint;

  @JsonKey(ignore: true)
  LineStringData? _asLineString;

  Route({
    required this.id,
    required this.coordinates,
    required this.startPoint,
    required this.endPoint,
  });

  LineStringData get asLineString {
    return _asLineString ??= LineStringData(
        type: "LineString",
        coordinates: coordinates
            .map((coord) => [coord.longitude, coord.latitude, coord.height])
            .toList());
  }

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  Map<String, dynamic> toJson() => _$RouteToJson(this);
}
