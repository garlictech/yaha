import 'package:flutter/material.dart';

class PageTitleText extends StatelessWidget {
  final String text;

  const PageTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Colors.white));
  }
}
