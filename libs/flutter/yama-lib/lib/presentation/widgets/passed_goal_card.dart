import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:yama_lib/domain/entities/goal.dart';
import 'package:yama_lib/domain/usecases/goals.dart';
import 'package:yama_lib/presentation/widgets/snackbar_content.dart';
import 'package:yama_lib/l10n/app_localizations.dart';

import 'daily_checkin.dart';
import 'goal_card_container.dart';
import 'goal_summary_card_data_row.dart';

class PassedGoalCard extends ConsumerWidget {
  final Goal goal;

  const PassedGoalCard({super.key, required this.goal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final start = DateFormat.yMMMd().format(goal.start);
    final end = DateFormat.yMMMd().format(goal.deadline);

    return Dismissible(
        key: Key(goal.id ?? ""),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            ref.read(goalsProvider.notifier).deleteGoal(goal).then((_) =>
                _showSnackbar(AppLocalizations.of(context).goalDeleted, context,
                    Colors.redAccent));
          } else {
            ref.read(goalsProvider.notifier).archiveGoal(goal).then((_) {
              _showSnackbar(AppLocalizations.of(context).goalArchived, context,
                  Colors.purpleAccent);
            });
          }
        },
        background: Container(
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Colors.redAccent,
            child: const Icon(Icons.delete, color: Colors.white, size: 50)),
        secondaryBackground: Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Colors.purpleAccent,
            child: const Icon(Icons.archive, color: Colors.white, size: 50)),
        confirmDismiss: (direction) => promptUser(direction, context),
        child: GoalCardContainer(
            child: Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(goal.text,
                    style: Theme.of(context).textTheme.titleMedium)),
            GoalSummaryCardDataRow(
                title: AppLocalizations.of(context).started, value: start),
            GoalSummaryCardDataRow(
                title: AppLocalizations.of(context).finished, value: end),
            const Divider(),
            DailyCheckin(goal: goal, canModify: false)
          ])
        ])));
  }

  _showSnackbar(String message, BuildContext context, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        content: SnackbarContent(text: message)));
  }

  Future<bool> promptUser(
      DismissDirection direction, BuildContext context) async {
    String message;
    if (direction == DismissDirection.startToEnd) {
      message = AppLocalizations.of(context).confirmDelete;
    } else {
      message = AppLocalizations.of(context).confirmArchive;
    }

    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text(AppLocalizations.of(context).ok),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: Text(AppLocalizations.of(context).cancel),
                onPressed: () {
                  return Navigator.of(context).pop(false);
                },
              )
            ],
          ),
        ) ??
        false; // In case the user dismisses the dialog by clicking away from it
  }
}
