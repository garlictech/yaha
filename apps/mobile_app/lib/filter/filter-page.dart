import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

import 'filter-state.dart';

class FilterPage extends ConsumerWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var filterSettingsStateNotifier =
        watch(filterSettingsStateProvider.notifier);
    var filterSettingsState = watch(filterSettingsStateProvider);
    SfRangeValues _lengthValues = SfRangeValues(
        filterSettingsState.lengthMin, filterSettingsState.lengthMax);
    SfRangeValues _durationValues = SfRangeValues(
        filterSettingsState.durationMin, filterSettingsState.durationMax);

    double _durationValue = filterSettingsState.searchRadius;

    //double _currentSliderValue = 20;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: YahaSpaceSizes.general,
            left: YahaSpaceSizes.large,
            //bottom: YahaSpaceSizes.general,
          ),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                'Hike length (km)',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
              )),
        ),
        /*Slider(
          value: _currentSliderValue,
          min: 0,
          max: 100,
          divisions: 5,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            /*setState(() {
              _currentSliderValue = value;
            })*/;
          },
        ),*/
        Container(
          padding: EdgeInsets.only(
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
          padding: EdgeInsets.only(
            left: YahaSpaceSizes.large,
            //bottom: YahaSpaceSizes.general,
          ),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                'Duration (hour)',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
              )),
        ),
        Container(
          padding: EdgeInsets.only(
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
          padding: EdgeInsets.only(
            left: YahaSpaceSizes.large,
            //bottom: YahaSpaceSizes.general,
          ),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                'Search radius (km)',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
              )),
        ),
        Container(
          padding: EdgeInsets.only(
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
          padding: EdgeInsets.only(
            left: YahaSpaceSizes.large,
            bottom: YahaSpaceSizes.general,
          ),
          child: SizedBox(
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
              bottom: YahaSpaceSizes.large),
          child: ToggleSwitch(
            minWidth: 100,
            activeBgColor: [YahaColors.primary],
            inactiveBgColor: YahaColors.accentColor,
            dividerColor: YahaColors.primary,
            initialLabelIndex: filterSettingsState.difficultyIndex,
            totalSwitches: 3,
            labels: ['1', '2', '3'],
            onToggle: (index) {
              var newDifficultyState;
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
                  newDifficultyState, index);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(YahaSpaceSizes.general),
          child: SizedBox(
            height: YahaBoxSizes.buttonHeight,
            width: YahaBoxSizes.buttonWidthBig,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Show results',
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
