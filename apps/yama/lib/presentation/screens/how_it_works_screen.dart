import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:yama_motivate/l10n/app_localizations.dart';
import 'package:yama_motivate/presentation/theme.dart';
import 'package:yama_motivate/presentation/widgets/explanation_info_item.dart';
import 'package:yama_motivate/presentation/widgets/explanation_section.dart';
import 'package:yama_motivate/presentation/widgets/start_now_button.dart';

class HowItWorksScreen extends StatefulWidget {
  const HowItWorksScreen({super.key});

  @override
  State<HowItWorksScreen> createState() => _HowItWorksScreenState();
}

class _HowItWorksScreenState extends State<HowItWorksScreen> {
  @override
  Widget build(BuildContext context) {
    const textColor = Colors.white;

    return Scaffold(
        backgroundColor: primaryColor[900],
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.howDoesItWork),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                child: Column(children: [
                  Column(children: [
                    ExplanationSection(
                        text: AppLocalizations.of(context)!.introExplanation1,
                        isBold: true,
                        color: textColor),
                    ExplanationSection(
                        text: AppLocalizations.of(context)!.introExplanation2,
                        color: textColor),
                    ExplanationSection(
                        text: AppLocalizations.of(context)!.introExplanation3,
                        color: textColor),
                    ExplanationSection(
                        text: AppLocalizations.of(context)!.introExplanation4,
                        color: textColor),
                    const SizedBox(height: 20),
                    const StartNowButton(),
                    const SizedBox(height: 30),
                    ...[
                      AppLocalizations.of(context)!.intro1,
                      AppLocalizations.of(context)!.intro2,
                      AppLocalizations.of(context)!.intro3,
                      AppLocalizations.of(context)!.intro4,
                      AppLocalizations.of(context)!.intro5,
                      AppLocalizations.of(context)!.intro6
                    ]
                        .mapIndexed((index, text) => ExplanationInfoItem(
                              index: index + 1,
                              textColor: textColor,
                              body: text,
                            ))
                        .toList(),
                    ExplanationSection(
                        text: AppLocalizations.of(context)!.introExplanation5,
                        color: textColor),
                    ExplanationSection(
                        text: AppLocalizations.of(context)!.introExplanation6,
                        isBold: true,
                        color: textColor),
                    const SizedBox(height: 10),
                    const StartNowButton(),
                    const SizedBox(height: 20),
                  ])
                ]))));
  }
}
