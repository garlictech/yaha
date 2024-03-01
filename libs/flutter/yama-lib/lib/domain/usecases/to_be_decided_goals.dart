import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_lib/domain/usecases/goals.dart';

part "to_be_decided_goals.g.dart";

@riverpod
class ToBeDecidedGoals extends _$ToBeDecidedGoals {
  @override
  GoalState build() {
    final goalsState = ref.watch(goalsProvider);

    if (goalsState.working) {
      return GoalState([], true);
    }

    final ongoingGoals =
        goalsState.goals.where((goal) => goal.isDecidingTime).toList();

    ongoingGoals
        .sort((goal1, goal2) => goal1.deadline.compareTo(goal2.deadline));

    return GoalState(ongoingGoals, false);
  }
}
