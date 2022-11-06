import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/domain/domain.dart';

part 'route.g.dart';

@JsonSerializable(explicitToJson: true)
class Route {
  final String id;
  final List<Waypoint> coordinates;
  final List<Image> images;
  final String? municipality;

  @JsonKey(ignore: true)
  LineStringData? _asLineString;

  Route(
      {required this.id,
      required this.coordinates,
      required this.images,
      this.municipality});

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
