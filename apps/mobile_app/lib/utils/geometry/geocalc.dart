import 'dart:math';

class GeoCalc {
  static double lineLength(List<List<double>> coordinates) {
    double _calculateDistance(lat1, lon1, lat2, lon2) {
      var p = 0.017453292519943295;
      var c = cos;
      var a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
      return 12742 * asin(sqrt(a)) * 1000.0;
    }

    var _length = 0.0;
    for (var i = 0; i < coordinates.length - 1; i++) {
      var p1 = coordinates[i];
      var p2 = coordinates[i + 1];
      _length += _calculateDistance(p1[1], p1[0], p2[1], p2[0]);
    }

    return _length;
  }

  static double calculateUphill(List<List<double>> coordinates) {
    return _calculateHill(coordinates, (diff) => diff > 0, 1);
  }

  static double calculateDownhill(List<List<double>> coordinates) {
    return _calculateHill(coordinates, (diff) => diff < 0, -1);
  }

  static double _calculateHill(List<List<double>> coordinates,
      Function(double) bigEnough, double multiplier) {
    double sum = 0;

    for (var i = 1; i < coordinates.length; i++) {
      final diff = coordinates[i][2] - coordinates[i - 1][2];

      if (bigEnough(diff)) {
        sum += diff * multiplier;
      }
    }

    return sum.round().toDouble();
  }
}