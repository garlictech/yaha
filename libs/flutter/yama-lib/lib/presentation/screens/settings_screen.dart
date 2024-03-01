import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yama_lib/l10n/app_localizations.dart';
import 'package:yama_lib/presentation/screens/account_screen.dart';
import 'package:yama_lib/presentation/widgets/daily_reminder_settings.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).settings),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AccountScreen()),
                          );
                        },
                        child:
                            Text(AppLocalizations.of(context).accountSettings)),
                    const SizedBox(height: 20),
                    const DailyReminderSettings()
                  ]),
            )));
  }
}
