import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yama_lib/presentation/theme.dart';
import 'package:yama_lib/presentation/widgets/dialog_title.dart';

class OnboardingDialogTitle extends StatelessWidget {
  final String text;

  const OnboardingDialogTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return DialogTitle(
        text: text, color: primaryColor, icon: FontAwesomeIcons.compass);
  }
}
