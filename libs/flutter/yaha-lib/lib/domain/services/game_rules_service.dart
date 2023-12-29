abstract class GameRulesService {
  int calculateDifficulty(double distanceInMeters, double uphillInMeters);

  int calculateScore(double distanceInMeters, double uphillInMeters);

  double estimatedTime(
      double distanceInMeters, double uphillInMeters, double averageSpeed);
}
