import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../shared/shared.dart';
import 'filter-state.dart';
import 'search-results-screen.dart';

class HikeFilterPage extends ConsumerWidget {
  const HikeFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filterSettingsStateNotifier =
        ref.watch(filterSettingsStateProvider.notifier);
    var filterSettingsState = ref.watch(filterSettingsStateProvider);
    SfRangeValues _lengthValues = SfRangeValues(
        filterSettingsState.lengthMin, filterSettingsState.lengthMax);
    SfRangeValues _durationValues = SfRangeValues(
        filterSettingsState.durationMin, filterSettingsState.durationMax);

    double _durationValue = filterSettingsState.searchRadius;

    return Column(
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
            values: _lengthValues,
            onChanged: (dynamic value) {
              filterSettingsStateNotifier.updateLength(value.start, value.end);
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
            values: _durationValues,
            onChanged: (dynamic value) {
              filterSettingsStateNotifier.updateDuration(
                  value.start, value.end);
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
            value: _durationValue,
            interval: 20,
            showTicks: false,
            showLabels: false,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (dynamic value) {
              filterSettingsStateNotifier.updateSearchRadius(value);
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
            activeBgColor: const [YahaColors.primary],
            inactiveBgColor: YahaColors.accentColor,
            dividerColor: YahaColors.primary,
            initialLabelIndex: filterSettingsState.difficultyIndex,
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

              filterSettingsStateNotifier.updateDifficulty(
                  newDifficultyState, index ?? 0);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: YahaSpaceSizes.large),
          child: SizedBox(
            height: YahaBoxSizes.buttonHeight,
            width: YahaBoxSizes.buttonWidthBig,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchResultsScreen()));
              },
              child: const Text('Show results',
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w600,
                  )),
              style: ElevatedButton.styleFrom(
                primary: YahaColors.primary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(YahaBorderRadius.general))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void setState(Null Function() param0) {}