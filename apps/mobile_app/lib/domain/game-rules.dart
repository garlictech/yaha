import 'dart:math';

class GameRules {
  static int calculateDifficulty(
      double distanceInMeters, double uphillInMeters) {
    final score = ((((uphillInMeters * 3.2808398950131) /
                        (distanceInMeters * 3.280839895)) *
                    550 +
                sqrt(distanceInMeters * distanceInMeters * 0.000002316612951)) /
            2.5)
        .round();

    if (score <= 13) {
      return 0;
    } else if (score <= 23) {
      return 1;
    } else {
      return 2;
    }
  }

  static int calculateScore(double distanceInMeters, double uphillInMeters) {
    return (((distanceInMeters / 1000) * 1.5 + uphillInMeters / 50) * 10)
        .round();
  }

  static double estimatedTime(
      double distanceInMeters, double uphillInMeters, double averageSpeed) {
    final distanceInKm = distanceInMeters / 1000;
    return ((distanceInKm / averageSpeed) * 60 + (uphillInMeters / 10))
        .round()
        .toDouble();
  }
}
