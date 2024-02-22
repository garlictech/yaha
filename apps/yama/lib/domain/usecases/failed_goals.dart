import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_motivate/domain/usecases/goals.dart';

part "failed_goals.g.dart";

@riverpod
class FailedGoals extends _$FailedGoals {
  @override
  GoalState build() {
    final goalsState = ref.watch(goalsProvider);

    if (goalsState.working) {
      return GoalState([], true);
    }

    final ongoingGoals =
        goalsState.goals.where((goal) => goal.isFailed).toList();
    ongoingGoals
        .sort((goal1, goal2) => goal1.deadline.compareTo(goal2.deadline));

    return GoalState(ongoingGoals, false);
  }
}
