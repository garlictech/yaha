import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yama_motivate/domain/entities/goal.dart';

class GoalProgressIndicator extends StatelessWidget {
  final Goal goal;
  const GoalProgressIndicator({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    final progressColor = goal.progressColor;

    return LinearPercentIndicator(
        lineHeight: 6.0,
        animation: true,
        percent: goal.ratioTowardFinish,
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        progressColor: progressColor,
        barRadius: const Radius.circular(6));
  }
}
