import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import '../../../events/screens/event-detail-screen.dart';
import '../../../events/screens/events.dart';
import '../../../events/widgets/event-box.dart';

class EventsSummaryLine extends StatelessWidget {
  const EventsSummaryLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Events starting next month',
            style: TextStyle(
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600,
                color: YahaColors.textColor),
          ),
        ),
        SizedBox(
          height: YahaBoxSizes.heightGeneral,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                padding: const EdgeInsets.only(right: YahaSpaceSizes.general),
                child: const EventBox(
                    background:
                        'packages/flutter_yaha_lib/assets/images/nagy-egedi-itura.png',
                    height: YahaBoxSizes.heightGeneral,
                    width: YahaBoxSizes.widthGeneral,
                    nextScreen: EventDetailScreen()),
              ),
              Container(
                padding: const EdgeInsets.only(right: YahaSpaceSizes.general),
                child: const EventBox(
                    background:
                        'packages/flutter_yaha_lib/assets/images/bukki-batyus-barangolas.png',
                    height: YahaBoxSizes.heightGeneral,
                    width: YahaBoxSizes.widthGeneral,
                    nextScreen: EventDetailScreen()),
              ),
              const EventBox(
                  background:
                      'packages/flutter_yaha_lib/assets/images/nagy-egedi-itura.png',
                  height: YahaBoxSizes.heightGeneral,
                  width: YahaBoxSizes.widthGeneral,
                  nextScreen: EventDetailScreen()),
            ],
          ),
        ),
        const ShowMoreButton(nextScreen: Events()),
      ],
    );
  }
}
