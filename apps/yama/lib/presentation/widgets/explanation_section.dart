import 'package:flutter/material.dart';

class ExplanationSection extends StatelessWidget {
  final String text;
  final bool isBold;
  final Color color;

  const ExplanationSection(
      {super.key,
      required this.text,
      this.isBold = false,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(text,
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: color,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 14 : 12)),
      const SizedBox(height: 15),
    ]);
  }
}
