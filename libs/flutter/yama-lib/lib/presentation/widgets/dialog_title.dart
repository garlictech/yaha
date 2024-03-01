import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DialogTitle extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;

  const DialogTitle(
      {super.key, required this.text, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FaIcon(icon, size: 40),
      Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(text)),
      const Divider()
    ]);
  }
}
