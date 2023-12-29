import '../../value_objects/value_objects.dart';
import 'route_entity.dart';

class TrailEntity extends RouteEntity {
  LineStringData? asLineString_;

  TrailEntity({required RouteEntity route})
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

  GeoPoint get startPoint => coordinates.first.location;
  GeoPoint get endPoint => coordinates.last.location;

  List<GeoPoint> get coordinatesAsPoints =>
      coordinates.map((coord) => coord.location).toList();
}
