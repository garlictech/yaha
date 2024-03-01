import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yama_lib/domain/usecases/goals.dart';
import 'package:yama_lib/domain/usecases/settings.dart';
import 'package:yama_lib/l10n/app_localizations.dart';
import 'package:yama_lib/presentation/theme.dart';
import 'package:yama_lib/presentation/widgets/dialog_title.dart';
import 'package:yama_lib/presentation/widgets/onboarding_dialog.dart';

class AddGoal extends ConsumerStatefulWidget {
  const AddGoal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddGoalState();
}

class AddGoalState extends ConsumerState<AddGoal> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isButtonDisabled = true;
  bool _onboardingDisplayed = false;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_checkTextLength);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const onboardingKey = 'shortGoalLengthExplained';
    final onboardingWasAlreadyShown = ref.watch(settingsControllerProvider
        .select((val) => val.isOnboardingAlreadyShown(onboardingKey) ?? false));

    final shouldShowOnboarding =
        !onboardingWasAlreadyShown && !_onboardingDisplayed;

    return shouldShowOnboarding
        ? OnboardingDialog(
            onboardingKey: onboardingKey,
            dismissed: () => setState(() => _onboardingDisplayed = true))
        : AlertDialog(
            title: DialogTitle(
                text: AppLocalizations.of(context).addNewGoal,
                color: accentColor,
                icon: FontAwesomeIcons.bullseye),
            content: _busy
                ? Text(AppLocalizations.of(context).reserving)
                : Column(mainAxisSize: MainAxisSize.min, children: [
                    TextField(
                      controller: _textEditingController,
                      maxLines: 3,
                      maxLength: 66,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).enterGoal,
                      ),
                    ),
                  ]),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context).cancel),
              ),
              ElevatedButton(
                onPressed: _isButtonDisabled
                    ? null
                    : () {
                        setState(() {
                          _isButtonDisabled = true;
                          _busy = true;
                        });
                        final text = _textEditingController.text.trim();
                        ref
                            .read(goalsProvider.notifier)
                            .addGoal(text: text)
                            .then((_) {
                          Navigator.of(context).pop();
                        }).catchError((e) {
                          setState(() {
                            _isButtonDisabled = false;
                            _busy = false;
                          });
                        });
                      },
                child: Text(AppLocalizations.of(context).commit),
              ),
            ],
          );
  }

  void _checkTextLength() {
    setState(() {
      _isButtonDisabled = _textEditingController.text.length < 5;
    });
  }
}
