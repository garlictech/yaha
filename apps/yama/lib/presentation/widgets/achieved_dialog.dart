import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yama_motivate/domain/entities/goal.dart';
import 'package:yama_motivate/domain/usecases/goals.dart';
import 'package:yama_motivate/l10n/app_localizations.dart';

void showAchievedDialog(context, Goal goal) {
  showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: ((context, ref, child) {
          final goalsController = ref.read(goalsProvider.notifier);
          final working =
              ref.watch(goalsProvider.select((state) => state.working));

          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.goalAchievedTitle),
            content: Text(AppLocalizations.of(context)!.goalAchievedBody,
                textAlign: TextAlign.justify),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.cancel)),
              if (!working)
                ElevatedButton(
                    onPressed: () {
                      goalsController
                          .setGoalCompleted(goal)
                          .then((_) => Navigator.of(context).pop());
                    },
                    child: Text(AppLocalizations.of(context)!.confirm)),
              if (working) const CircularProgressIndicator()
            ],
          );
        }));
      });
}
