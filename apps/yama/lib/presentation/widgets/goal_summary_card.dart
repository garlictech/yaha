import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yama_motivate/domain/entities/goal.dart';
import 'package:yama_motivate/l10n/app_localizations.dart';
import 'package:yama_motivate/presentation/widgets/achieved_dialog.dart';
import 'package:yama_motivate/presentation/widgets/daily_checkin.dart';
import 'package:yama_motivate/presentation/widgets/failed_dialog.dart';
import 'package:yama_motivate/presentation/widgets/goal_card_container.dart';
import 'package:yama_motivate/presentation/widgets/goal_progress_indicator.dart';
import 'package:yama_motivate/presentation/widgets/goal_summary_card_data_row.dart';

class GoalSummaryCard extends StatelessWidget {
  final Goal goal;

  const GoalSummaryCard({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    final start = DateFormat.yMMMd().format(goal.start);
    final end = DateFormat.yMMMd().format(goal.deadline);
    final progressColor = goal.progressColor;

    return GoalCardContainer(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                if (goal.isDecidingTime)
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CircularCountDownTimer(
                        duration: const Duration(days: 1).inSeconds,
                        initialDuration: goal.secondsUntilDeciding,
                        controller: CountDownController(),
                        width: 50,
                        height: 50,
                        ringColor: Colors.grey[300]!,
                        ringGradient: null,
                        fillColor: progressColor,
                        fillGradient: null,
                        backgroundColor: Colors.white,
                        backgroundGradient: null,
                        strokeWidth: 10.0,
                        strokeCap: StrokeCap.round,
                        textStyle: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textFormat: CountdownTextFormat.S,
                        isReverse: false,
                        isReverseAnimation: false,
                        isTimerTextShown: true,
                        autoStart: true,
                        timeFormatterFunction:
                            (defaultFormatterFunction, duration) {
                          String twoDigits(int n) =>
                              n.toString().padLeft(2, "0");
                          String twoDigitMinutes =
                              twoDigits(duration.inMinutes.remainder(60));
                          return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
                        },
                      )),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(goal.text,
                              style: Theme.of(context).textTheme.titleMedium)),
                      GoalSummaryCardDataRow(
                          title: AppLocalizations.of(context).started,
                          value: start),
                      GoalSummaryCardDataRow(
                          title: AppLocalizations.of(context).timeToDeadline,
                          value: end),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GoalProgressIndicator(goal: goal)),
                      if (goal.isDecidingTime)
                        Column(children: [
                          const Divider(),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 10),
                              child: Text(
                                  AppLocalizations.of(context).timeIsOver,
                                  style:
                                      Theme.of(context).textTheme.titleMedium)),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    OutlinedButton(
                                        onPressed: () {
                                          showAchievedDialog(context, goal);
                                        },
                                        child: Text(AppLocalizations.of(context)
                                            .yesss)),
                                    OutlinedButton(
                                        onPressed: () {
                                          showFailedDialog(context, goal);
                                        },
                                        child: Text(
                                            AppLocalizations.of(context).nope)),
                                  ]))
                        ])
                    ]))
              ]),
              if (goal.isOngoing || goal.isDecidingTime)
                Column(children: [const Divider(), DailyCheckin(goal: goal)])
            ])));
  }
}
