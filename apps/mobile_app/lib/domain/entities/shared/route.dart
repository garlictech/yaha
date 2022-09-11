import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/domain/domain.dart';

part 'route.g.dart';

@JsonSerializable(explicitToJson: true)
class Route {
  final String id;
  final List<Waypoint> coordinates;
  final List<String> onroutePois;
  final List<String> offroutePois;
  final List<Image> images;

  @JsonKey(ignore: true)
  LineStringData? _asLineString;

  Route(
      {required this.id,
      required this.coordinates,
      required this.onroutePois,
      required this.offroutePois,
      required this.images});

  LineStringData get asLineString {
    return _asLineString ??= LineStringData(
        type: "LineString",
        coordinates: coordinates
            .map((coord) => [
                  coord.location.longitude,
                  coord.location.latitude,
                  coord.location.height
                ])
            .toList());
  }

  Point get startPoint => coordinates.first.location;
  Point get endPoint => coordinates.last.location;

  List<Point> get coordinatesAsPoints =>
      coordinates.map((coord) => coord.location).toList();

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  Map<String, dynamic> toJson() => _$RouteToJson(this);
}
