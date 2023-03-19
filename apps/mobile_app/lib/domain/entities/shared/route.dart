import 'package:yaha/domain/domain.dart';

import 'route_entity.dart';

class Route extends RouteEntity {
  LineStringData? asLineString_;

  Route({required RouteEntity route})
      : super(
            id: route.id,
            coordinates: route.coordinates,
            images: route.images,
            municipality: route.municipality);

  LineStringData get asLineString {
    return asLineString_ ??= LineStringData(
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
}
