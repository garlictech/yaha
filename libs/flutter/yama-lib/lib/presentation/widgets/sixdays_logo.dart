import 'package:flutter/material.dart';

class SixDaysLogo extends StatelessWidget {
  const SixDaysLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70,
        height: 70,
        child: Image.asset('assets/icon/appicon.png', fit: BoxFit.cover));
  }
}
