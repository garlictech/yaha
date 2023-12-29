import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:latlong2/latlong.dart';
import 'package:turf/turf.dart' as turf;

class GeoCalc {
  static double geoDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000.0;
  }

  static double lineLength(List<GeoPoint> coordinates) {
    var length = 0.0;
    for (var i = 0; i < coordinates.length - 1; i++) {
      var p1 = coordinates[i];
      var p2 = coordinates[i + 1];
      length +=
          geoDistance(p1.latitude, p1.longitude, p2.latitude, p2.longitude);
    }

    return length;
  }

  static double lineLengthByPositions(List<turf.Position> coordinates) {
    return _opByPositions(coordinates, GeoCalc.lineLength);
  }

  static double calculateUphill(List<GeoPoint> coordinates) {
    return _calculateHill(coordinates, (diff) => diff > 0, 1);
  }

  static double calculateUphillByPositions(List<turf.Position> coordinates) {
    return _opByPositions(coordinates, GeoCalc.calculateUphill);
  }

  static double calculateDownhill(List<GeoPoint> coordinates) {
    return _calculateHill(coordinates, (diff) => diff < 0, -1);
  }

  static double calculateDownhillByPositions(List<turf.Position> coordinates) {
    return _opByPositions(coordinates, GeoCalc.calculateDownhill);
  }

  static double _calculateHill(
      List<GeoPoint> coordinates, Function(num) bigEnough, num multiplier) {
    double sum = 0;

    for (var i = 1; i < coordinates.length; i++) {
      final diff = coordinates[i].height - coordinates[i - 1].height;

      if (bigEnough(diff)) {
        sum += diff * multiplier;
      }
    }

    return sum.round().toDouble();
  }

  static _opByPositions(List<turf.Position> positions, Function op) {
    final coords = positions.map((pos) {
      if (pos.alt == null) {
        throw "Altitude missing!";
      }

      return GeoPoint(
          latitude: pos.lat.toDouble(),
          longitude: pos.lng.toDouble(),
          height: pos.alt!.toDouble());
    }).toList();
    try {
      return op(coords);
    } catch (err, stack) {
      debugPrint(err.toString());
      debugPrint(stack.toString());
    }
  }

  static LatLngBounds getPaddedWaypointBounds(List<Waypoint> waypoints) {
    if (waypoints.isEmpty) {
      throw "Waypoints list is empty!";
    }

    final firstBoundary = waypoints.first.location;
    final lastBoundary = waypoints.last.location;
    final corner1 = LatLng(firstBoundary.latitude, firstBoundary.longitude);
    final corner2 = LatLng(lastBoundary.latitude, lastBoundary.longitude);
    final bounds = LatLngBounds(corner1, corner2);

    for (var point in waypoints) {
      bounds.extend(LatLng(point.location.latitude, point.location.longitude));
    }

    final paddedBounds = addPaddingToBounds(bounds, 0.2);

    return paddedBounds;
  }

  static LatLngBounds addPaddingToBounds(
      LatLngBounds bounds, double paddingFactor) {
    // Calculate new latitude span with padding
    double latPadding =
        (bounds.northEast.latitude - bounds.southWest.latitude) * paddingFactor;
    double newNorthLat = bounds.northEast.latitude + latPadding;
    double newSouthLat = bounds.southWest.latitude - latPadding;

    // Calculate new longitude span with padding
    double lngPadding =
        (bounds.northEast.longitude - bounds.southWest.longitude) *
            paddingFactor;
    double newEastLng = bounds.northEast.longitude + lngPadding;
    double newWestLng = bounds.southWest.longitude - lngPadding;

    // Create new padded bounds
    LatLngBounds newBounds = LatLngBounds(
      LatLng(newNorthLat, newEastLng),
      LatLng(newSouthLat, newWestLng),
    );

    return newBounds;
  }
}
