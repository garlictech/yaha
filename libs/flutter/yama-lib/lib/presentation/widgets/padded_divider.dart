import 'package:flutter/material.dart';

class PaddedDivider extends StatelessWidget {
  const PaddedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(height: 10),
      Divider(color: Colors.white),
      SizedBox(height: 10),
    ]);
  }
}
