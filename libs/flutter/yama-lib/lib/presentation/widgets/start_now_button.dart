import 'package:flutter/material.dart';
import 'package:yama_lib/l10n/app_localizations.dart';
import 'package:yama_lib/presentation/screens/login_screen.dart';

class StartNowButton extends StatelessWidget {
  const StartNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: Text(AppLocalizations.of(context)!.startToday));
  }
}
