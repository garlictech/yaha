import 'package:flutter/material.dart';
import 'package:yama_lib/l10n/app_localizations.dart';
import 'package:yama_lib/presentation/screens/how_it_works_screen.dart';

class HowItworksButton extends StatelessWidget {
  const HowItworksButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HowItWorksScreen()),
          );
        },
        child: Text(AppLocalizations.of(context)!.howDoesItWork));
  }
}
