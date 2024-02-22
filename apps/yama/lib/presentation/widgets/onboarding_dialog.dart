import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yama_motivate/domain/usecases/settings.dart';
import 'package:yama_motivate/l10n/app_localizations.dart';

import 'onboarding_dialog_title.dart';

class OnboardingDialog extends ConsumerWidget {
  final String onboardingKey;
  final VoidCallback? dismissed;

  const OnboardingDialog(
      {super.key, required this.onboardingKey, this.dismissed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? onboardingText;
    String? onboardingTitleText;

    final checkboxValue = ref.watch(settingsControllerProvider.select(
        (settings) =>
            settings.isOnboardingAlreadyShown(onboardingKey) ?? false));

    switch (onboardingKey) {
      case 'shortGoalLengthExplained':
        onboardingText = AppLocalizations.of(context)?.onboarding_shortGoalText;
        onboardingTitleText =
            AppLocalizations.of(context)?.onboarding_shortGoalText_title;
    }

    return AlertDialog(
        title: OnboardingDialogTitle(text: onboardingTitleText ?? ''),
        content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(onboardingText ?? '', textAlign: TextAlign.justify),
              const Padding(
                  padding: EdgeInsets.only(top: 10), child: Divider()),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          //checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: checkboxValue,
                          onChanged: (bool? value) async {
                            await ref
                                .read(settingsControllerProvider.notifier)
                                .toggleOnboardingItem(onboardingKey);
                          },
                        ),
                        Text(AppLocalizations.of(context)?.dontShowAgain ?? ""),
                      ])),
              OutlinedButton(
                  onPressed: () {
                    final dismissedLocal = dismissed;
                    if (dismissedLocal != null) {
                      dismissedLocal();
                    }
                  },
                  child: Text(AppLocalizations.of(context)?.gotIt ?? ""))
            ])));
  }
}
