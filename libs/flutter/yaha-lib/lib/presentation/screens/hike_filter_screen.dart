import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../widgets/shared/shared.dart';

class HikeFilters extends ConsumerWidget {
  const HikeFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var trackSearchFiltersService =
        ref.read(trackSearchFiltersServiceProvider.notifier);
    var trackSearchFilters = ref.watch(trackSearchFiltersServiceProvider);
    SfRangeValues lengthValues = SfRangeValues(
        trackSearchFilters.lengthMin, trackSearchFilters.lengthMax);
    SfRangeValues durationValues = SfRangeValues(
        trackSearchFilters.durationMin, trackSearchFilters.durationMax);

    int durationValue = trackSearchFilters.searchRadius;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: YahaSpaceSizes.general,
            left: YahaSpaceSizes.large,
            //bottom: YahaSpaceSizes.general,
          ),
          child: const SizedBox(
              width: double.infinity,
              child: Text(
                'Hike length (km)',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
              )),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: YahaSpaceSizes.general,
            right: YahaSpaceSizes.general,
            bottom: YahaSpaceSizes.general,
          ),
          child: SfRangeSlider(
            min: 0.0,
            max: 100.0,
            interval: 20,
            showTicks: false,
            showLabels: false,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            values: lengthValues,
            onChanged: (dynamic value) {
              trackSearchFiltersService.updateLength(value.start, value.end);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: YahaSpaceSizes.large,
            //bottom: YahaSpaceSizes.general,
          ),
          child: const SizedBox(
              width: double.infinity,
              child: Text(
                'Duration (hour)',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
              )),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: YahaSpaceSizes.general,
            right: YahaSpaceSizes.general,
            bottom: YahaSpaceSizes.general,
          ),
          child: SfRangeSlider(
            min: 0.0,
            max: 100.0,
            interval: 20,
            showTicks: false,
            showLabels: false,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            values: durationValues,
            onChanged: (dynamic value) {
              trackSearchFiltersService.updateDuration(value.start, value.end);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: YahaSpaceSizes.large,
            //bottom: YahaSpaceSizes.general,
          ),
          child: const SizedBox(
              width: double.infinity,
              child: Text(
                'Search radius (km)',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
              )),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: YahaSpaceSizes.general,
            right: YahaSpaceSizes.general,
            bottom: YahaSpaceSizes.large,
          ),
          child: SfSlider(
            min: 0.0,
            max: 100.0,
            value: durationValue,
            interval: 20,
            showTicks: false,
            showLabels: false,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (dynamic value) {
              trackSearchFiltersService.updateSearchRadius(value);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: YahaSpaceSizes.large,
            bottom: YahaSpaceSizes.general,
          ),
          child: const SizedBox(
              width: double.infinity,
              child: Text(
                'Difficulty',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
              )),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: YahaSpaceSizes.general,
              right: YahaSpaceSizes.general,
              bottom: YahaSpaceSizes.xLarge),
          child: ToggleSwitch(
            minWidth: 100,
            inactiveBgColor: YahaColors.accentColor,
            initialLabelIndex: trackSearchFilters.difficultyIndex,
            totalSwitches: 3,
            labels: const ['1', '2', '3'],
            onToggle: (index) {
              int newDifficultyState = 0;
              switch (index) {
                case 0:
                  newDifficultyState = 1;
                  break;
                case 1:
                  newDifficultyState = 2;
                  break;
                case 2:
                  newDifficultyState = 3;
                  break;
              }

              trackSearchFiltersService.updateDifficulty(
                  newDifficultyState, index ?? 0);
            },
          ),
        ),
      ],
    );
  }
}
