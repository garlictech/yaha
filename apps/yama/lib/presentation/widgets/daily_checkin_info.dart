import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yama_motivate/l10n/app_localizations.dart';
import 'package:yama_motivate/presentation/theme.dart';
import 'package:yama_motivate/presentation/widgets/dialog_title.dart';
import 'package:yama_motivate/presentation/widgets/explanation_section.dart';

import 'explanation_info_item.dart';

class DailyCheckinInfo extends StatelessWidget {
  const DailyCheckinInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: DialogTitle(
            text: AppLocalizations.of(context).dailyCheckin,
            color: accentColor,
            icon: FontAwesomeIcons.circleInfo),
        content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              ExplanationSection(
                  text: AppLocalizations.of(context).dailyCheckinInfoSummary,
                  isBold: true,
                  color: textColor),
              ...[
                AppLocalizations.of(context).dailyCheckinInfoBody1,
                AppLocalizations.of(context).dailyCheckinInfoBody2,
                AppLocalizations.of(context).dailyCheckinInfoBody3,
                AppLocalizations.of(context).dailyCheckinInfoBody4
              ]
                  .mapIndexed((index, text) => ExplanationInfoItem(
                        index: index + 1,
                        textColor: textColor,
                        body: text,
                      ))
                  .toList(),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context).gotIt))
            ])));
  }
}
