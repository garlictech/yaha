import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:turf/turf.dart' as turf;
import 'package:yaha/domain/entities/entities.dart';

class GeoCalc {
  static double geoDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000.0;
  }

  static double lineLength(List<Point> coordinates) {
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

  static double calculateUphill(List<Point> coordinates) {
    return _calculateHill(coordinates, (diff) => diff > 0, 1);
  }

  static double calculateUphillByPositions(List<turf.Position> coordinates) {
    return _opByPositions(coordinates, GeoCalc.calculateUphill);
  }

  static double calculateDownhill(List<Point> coordinates) {
    return _calculateHill(coordinates, (diff) => diff < 0, -1);
  }

  static double calculateDownhillByPositions(List<turf.Position> coordinates) {
    return _opByPositions(coordinates, GeoCalc.calculateDownhill);
  }

  static double _calculateHill(
      List<Point> coordinates, Function(num) bigEnough, num multiplier) {
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

      return Point(
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
}
