import 'package:flutter/material.dart';

class GoalSummaryCardDataRow extends StatelessWidget {
  final String title;
  final String value;

  const GoalSummaryCardDataRow(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: Theme.of(context).textTheme.titleSmall),
      Text(value)
    ]);
  }
}
