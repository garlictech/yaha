import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yama_lib/domain/entities/goal.dart';
import 'package:yama_lib/domain/usecases/goals.dart';
import 'package:yama_lib/l10n/app_localizations.dart';

void showFailedDialog(context, Goal goal) {
  showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: ((context, ref, child) {
          final goalsController = ref.read(goalsProvider.notifier);
          final working =
              ref.watch(goalsProvider.select((state) => state.working));

          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.goalFailedTitle),
            content: Text(AppLocalizations.of(context)!.goalFailedBody,
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
                          .setGoalFailed(goal)
                          .then((_) => Navigator.of(context).pop());
                    },
                    child: Text(AppLocalizations.of(context)!.confirm)),
              if (working) const CircularProgressIndicator()
            ],
          );
        }));
      });
}
