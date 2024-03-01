import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yama_lib/domain/entities/goal.dart';

class GoalList extends ConsumerWidget {
  final List<Widget> goals;
  final String title;
  final GoalStatus goalStatus;

  const GoalList(
      {required this.goalStatus,
      required this.goals,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData icon = FontAwesomeIcons.clock;
    Color iconColor = Colors.orange;

    if (goalStatus == GoalStatus.achieved) {
      iconColor = Colors.green;
      icon = FontAwesomeIcons.thumbsUp;
    } else if (goalStatus == GoalStatus.failed) {
      iconColor = Colors.red;
      icon = FontAwesomeIcons.thumbsDown;
    } else if (goalStatus == GoalStatus.toBeDecided) {
      icon = FontAwesomeIcons.circleQuestion;
    }

    return Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FaIcon(icon, color: iconColor)),
            Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge)
          ])),
      Column(children: goals)
    ]);
  }
}
