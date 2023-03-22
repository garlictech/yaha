import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:yaha/ui/views/screens/login_screen.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providers = [EmailAuthProvider()];

    return Scaffold(
        appBar: AppBar(title: const Text("Account profile")),
        body: fb.ProfileScreen(
          providers: providers,
          actions: [
            SignedOutAction((context) {
              PersistentNavBarNavigator.pushNewScreen(context,
                  screen: const LoginScreen(), withNavBar: false);
            }),
          ],
        ));
  }
}
