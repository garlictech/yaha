import 'package:flutter/material.dart';

class GoalCardContainer extends StatelessWidget {
  final Widget child;

  const GoalCardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        child: Padding(padding: const EdgeInsets.all(10), child: child));
  }
}
