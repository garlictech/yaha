import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yama_lib/domain/entities/goal.dart';
import 'package:yama_lib/domain/usecases/goals.dart';
import 'package:yama_lib/l10n/app_localizations.dart';
import 'package:yama_lib/presentation/widgets/daily_checkin_info.dart';

const statusIconMap = {
  "onTrack": Tuple2(FontAwesomeIcons.thumbsUp, Colors.green),
  "offTrack": Tuple2(FontAwesomeIcons.thumbsDown, Colors.red),
  "waiting": Tuple2(FontAwesomeIcons.question, Colors.orange),
  "locked": Tuple2(FontAwesomeIcons.lock, Colors.grey)
};

class DailyCheckin extends ConsumerWidget {
  final Goal goal;
  final bool canModify;

  const DailyCheckin({super.key, required this.goal, this.canModify = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allowedMaxCheckinDays = goal.allowedMaxCheckinDays;

    return Column(children: [
      if (canModify)
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(AppLocalizations.of(context).dailyCheckin),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.circleInfo),
            iconSize: 20,
            splashRadius: 15,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const DailyCheckinInfo();
                  });
            },
          )
        ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: goal.dailyCheckinStatus.mapIndexed((i, status) {
            final iconColor = i > allowedMaxCheckinDays
                ? Colors.grey
                : statusIconMap[status]!.value2;

            return Column(children: [
              IconButton(
                icon: i > allowedMaxCheckinDays
                    ? FaIcon(statusIconMap["locked"]!.value1, color: iconColor)
                    : FaIcon(statusIconMap[status]!.value1, color: iconColor),
                iconSize: 20,
                splashRadius: 15,
                onPressed: !canModify || i > allowedMaxCheckinDays
                    ? null
                    : () {
                        ref
                            .read(goalsProvider.notifier)
                            .advanceDailyCheckinStatus(goal, i);
                      },
              ),
              if (canModify)
                Text((i + 1).toString(), style: const TextStyle(fontSize: 10))
            ]);
          }).toList())
    ]);
  }
}
