import 'package:flutter/material.dart';

class ProgressMessage extends StatelessWidget {
  final String message;
  final Widget child;

  const ProgressMessage(
      {super.key, required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        width: double.infinity,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10),
          child
        ]));
  }
}
