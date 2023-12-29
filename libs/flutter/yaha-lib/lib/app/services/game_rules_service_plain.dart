import 'package:flutter_yaha_lib/domain/domain.dart';

import '../utils/game_rules.dart';

class GameRulesServicePlain extends GameRulesService {
  @override
  int calculateDifficulty(double distanceInMeters, double uphillInMeters) {
    return GameRules.calculateDifficulty(distanceInMeters, uphillInMeters);
  }

  @override
  int calculateScore(double distanceInMeters, double uphillInMeters) {
    return GameRules.calculateScore(distanceInMeters, uphillInMeters);
  }

  @override
  double estimatedTime(
      double distanceInMeters, double uphillInMeters, double averageSpeed) {
    return GameRules.estimatedTime(
        distanceInMeters, uphillInMeters, averageSpeed);
  }
}
