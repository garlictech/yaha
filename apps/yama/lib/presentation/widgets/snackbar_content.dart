import 'package:flutter/material.dart';

class SnackbarContent extends StatelessWidget {
  final String text;

  const SnackbarContent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white)));
  }
}
