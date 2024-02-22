import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:yama_motivate/l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("6Days Better Me"),
        ),
        body: Center(
            child: SignInScreen(
          actions: [
            AuthStateChangeAction<SignedIn>((context, state) {
              Navigator.pushReplacementNamed(context, '/');
            }),
          ],
          styles: const {
            EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
          },
          subtitleBuilder: (context, action) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                action == AuthAction.signIn
                    ? AppLocalizations.of(context)!.signInSlogan
                    : AppLocalizations.of(context)!.registerSlogan,
              ),
            );
          },
          footerBuilder: (context, action) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  action == AuthAction.signIn
                      ? AppLocalizations.of(context)!.acceptSigninTerms
                      : AppLocalizations.of(context)!.acceptRegisterTerms,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            );
          },
        )));
  }
}
