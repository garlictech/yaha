import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:turf/helpers.dart' as turf;

import '../../domain/domain.dart';
import '../utils/geometry/geocalc_js.dart';
import '../utils/geometry/geometry.dart';

class GeocalcServicePlain extends GeocalcService {
  final GeocalcJs _geocalcJs;

  GeocalcServicePlain() : _geocalcJs = GeocalcJs();

  @override
  double lineLength(List<GeoPoint> coordinates) {
    return GeoCalc.lineLength(coordinates);
  }

  @override
  double calculateUphill(List<GeoPoint> coordinates) {
    return GeoCalc.calculateUphill(coordinates);
  }

  @override
  double calculateDownhill(List<GeoPoint> coordinates) {
    return GeoCalc.calculateDownhill(coordinates);
  }

  @override
  LatLngBounds getPaddedWaypointBounds(List<Waypoint> waypoints) {
    return GeoCalc.getPaddedWaypointBounds(waypoints);
  }

  @override
  Future<turf.LineString> snappedLineSlice(
      GeoPoint start, GeoPoint end, LineStringData path) {
    return _geocalcJs.snappedLineSlice(start, end, path);
  }

  @override
  Future<double> distanceOnLine(
      GeoPoint start, GeoPoint end, LineStringData path) {
    return _geocalcJs.distanceOnLine(start, end, path);
  }

  @override
  double calculateUphillByPositions(List<turf.Position> coordinates) {
    return GeoCalc.calculateUphillByPositions(coordinates);
  }

  @override
  double calculateDownhillByPositions(List<turf.Position> coordinates) {
    return GeoCalc.calculateDownhillByPositions(coordinates);
  }

  @override
  Future<List<LatLng>> getFixedDistanceCoordinates(
      LineStringData path, double chunkLengthInKm) {
    return _geocalcJs.getFixedDistanceCoordinates(path, chunkLengthInKm);
  }
}
