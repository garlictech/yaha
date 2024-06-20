import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yama_lib/data/revenuecat_purchase/providers/is_subscription_purchased.dart';
import 'package:yama_lib/data/revenuecat_purchase/revenuecat_purchase.dart';
import 'package:yama_lib/domain/entities/goal.dart';
import 'package:yama_lib/domain/usecases/failed_goals.dart';
import 'package:yama_lib/domain/usecases/goals.dart';
import 'package:yama_lib/domain/usecases/ongoing_goals.dart';
import 'package:yama_lib/domain/usecases/to_be_decided_goals.dart';
import 'package:yama_lib/l10n/app_localizations.dart';
import 'package:yama_lib/presentation/widgets/goal_summary_card.dart';
import 'package:yama_lib/presentation/widgets/passed_goal_card.dart';
import '../widgets/add_goal.dart';

import '../widgets/goal_list.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final failedGoals =
        ref.watch(failedGoalsProvider.select((state) => state.goals));
    final ongoingGoals =
        ref.watch(ongoingGoalsProvider.select((state) => state.goals));
    final toBeDecidedGoals =
        ref.watch(toBeDecidedGoalsProvider.select((state) => state.goals));
    final hasGoals =
        ref.watch(goalsProvider.select((state) => state.goals.isNotEmpty));

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).myGoals),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: hasGoals
              ? Column(children: [
                  if (toBeDecidedGoals.isNotEmpty)
                    GoalList(
                        goals: toBeDecidedGoals
                            .map((goal) => GoalSummaryCard(goal: goal))
                            .toList(),
                        title: AppLocalizations.of(context).toBeDecidedGoals,
                        goalStatus: GoalStatus.toBeDecided),
                  if (ongoingGoals.isNotEmpty)
                    GoalList(
                        goals: ongoingGoals
                            .map((goal) => GoalSummaryCard(goal: goal))
                            .toList(),
                        title: AppLocalizations.of(context).activeGoals,
                        goalStatus: GoalStatus.ongoing),
                  if (failedGoals.isNotEmpty)
                    GoalList(
                        goals: failedGoals
                            .map((goal) => PassedGoalCard(goal: goal))
                            .toList(),
                        title: AppLocalizations.of(context).failedGoals,
                        goalStatus: GoalStatus.failed),
                  const SizedBox(
                    height: 40,
                  )
                ])
              : Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  width: double.infinity,
                  child: Text(AppLocalizations.of(context).emptyGoals,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall),
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddGoalDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddGoalDialog() {
    ref
        .read(isSubscriptionPurchasedProvider.future)
        .then((isSubscriptionPurchased) {
      if (!isSubscriptionPurchased) {
        return ref.read(purchasedSubscriptionProvider.notifier).purchase();
      }

      showDialog(
        context: context,
        builder: (context) {
          return const AddGoal();
        },
      );
    });
  }
}
