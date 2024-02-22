import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_motivate/domain/usecases/goals.dart';

part "achieved_goals.g.dart";

@riverpod
class AchievedGoals extends _$AchievedGoals {
  @override
  GoalState build() {
    final goalsState = ref.watch(goalsProvider);

    if (goalsState.working) {
      return GoalState([], true);
    }

    final ongoingGoals =
        goalsState.goals.where((goal) => goal.isAchieved).toList();
    ongoingGoals
        .sort((goal1, goal2) => goal1.deadline.compareTo(goal2.deadline));

    return GoalState(ongoingGoals, false);
  }
}
