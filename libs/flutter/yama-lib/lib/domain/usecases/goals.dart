import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:revenuecat_purchase/providers/is_subscription_purchased.dart';
import 'package:revenuecat_purchase/providers/purchase_entitled.dart';
import 'package:revenuecat_purchase/providers/purchased_subscription.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_lib/data/repositories/goal.repository.service.dart';
import 'package:yama_lib/domain/usecases/payment.dart';

import '../entities/goal.dart';

part 'goals.g.dart';

class GoalState {
  final List<Goal> goals;
  final bool working;

  GoalState(this.goals, this.working);
}

const nextStatusMap = {
  "waiting": "onTrack",
  "onTrack": "offTrack",
  "offTrack": "onTrack",
};

@riverpod
class Goals extends _$Goals {
  @override
  GoalState build() {
    final goalRepo = ref.watch(goalRepositoryServiceProvider);

    goalRepo?.fetchGoals().then((goals) {
      state = GoalState(goals, false);
    });

    return GoalState([], true);
  }

  addGoal({required String text}) async {
    state = GoalState(state.goals, true);
    final paymentId = await ref.read(paymentProvider.notifier).executePayment();
    final goalRepo = ref.read(goalRepositoryServiceProvider);

    await goalRepo
        ?.addGoal(Goal(
            text: text,
            start: DateTime.now(),
            status: GoalStatus.ongoing,
            paymentId: paymentId))
        .then((goals) => state = GoalState(goals, false));
  }

  updateGoal(Goal goal) async {
    final goalRepo = ref.read(goalRepositoryServiceProvider);
    state = GoalState(state.goals, true);

    await goalRepo?.updateGoal(goal);
    final goals = await goalRepo?.fetchGoals();

    if (goals != null) {
      state = GoalState(goals, false);
    }
  }

  setGoalCompleted(Goal goal) async {
    state = GoalState(state.goals, true);
    await FirebaseFunctions.instance
        .httpsCallable('yamaGoalAchieved')({'goal_id': goal.id});
    final goalRepo = ref.read(goalRepositoryServiceProvider);
    final goals = await goalRepo?.fetchGoals();

    if (goals != null) {
      state = GoalState(goals, false);
    }
  }

  setGoalFailed(Goal goal) async {
    state = GoalState(state.goals, true);
    await FirebaseFunctions.instance
        .httpsCallable('yamaGoalFailed')({'goal_id': goal.id});
    final goalRepo = ref.read(goalRepositoryServiceProvider);
    final goals = await goalRepo?.fetchGoals();

    if (goals != null) {
      state = GoalState(goals, false);
    }
  }

  advanceDailyCheckinStatus(Goal goal, int dayIndex) async {
    var newDailyCheckinStatus = [...goal.dailyCheckinStatus];
    newDailyCheckinStatus[dayIndex] =
        nextStatusMap[newDailyCheckinStatus[dayIndex]]!;
    final newGoal = goal.copyWith(dailyCheckinStatus: newDailyCheckinStatus);
    return updateGoal(newGoal);
  }

  deleteGoal(Goal goal) async {
    if (goal.isOngoing) {
      debugPrint("Cannot remove ongoing goal");
      return;
    }

    final goalRepo = ref.read(goalRepositoryServiceProvider);
    await goalRepo?.deleteGoal(goal);
    await goalRepo?.fetchGoals();
  }

  archiveGoal(Goal goal) async {
    if (goal.isOngoing) {
      debugPrint("Cannot archive ongoing goal");
      return;
    }

    final goalRepo = ref.read(goalRepositoryServiceProvider);
    await goalRepo?.archiveGoal(goal);
    await goalRepo?.fetchGoals();
  }
}
