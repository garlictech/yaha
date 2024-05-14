import 'package:flutter/material.dart';
import 'package:yama_lib/l10n/app_localizations.dart';

class BackButtonFromPayment extends StatelessWidget {
  final bool isPaymentSuccessfull;
  const BackButtonFromPayment({super.key, required this.isPaymentSuccessfull});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context, isPaymentSuccessfull);
        },
        child: Text(AppLocalizations.of(context).backToGoals));
  }
}
