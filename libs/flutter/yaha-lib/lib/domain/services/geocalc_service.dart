import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:turf/helpers.dart' as turf;

import '../value_objects/value_objects.dart';

abstract class GeocalcService {
  double lineLength(List<GeoPoint> coordinates);
  double calculateUphill(List<GeoPoint> coordinates);
  double calculateDownhill(List<GeoPoint> coordinates);
  LatLngBounds getPaddedWaypointBounds(List<Waypoint> waypoints);

  Future<turf.LineString> snappedLineSlice(
      GeoPoint start, GeoPoint end, LineStringData path);

  Future<double> distanceOnLine(
      GeoPoint start, GeoPoint end, LineStringData path);

  double calculateUphillByPositions(List<turf.Position> coordinates);

  double calculateDownhillByPositions(List<turf.Position> coordinates);

  Future<List<LatLng>> getFixedDistanceCoordinates(
      LineStringData path, double chunkLengthInKm);
}
