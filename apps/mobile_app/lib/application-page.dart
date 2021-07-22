import 'package:flutter/material.dart';
import 'package:yaha/yaha-border-radius.dart';
import 'package:yaha/yaha-border-width.dart';
import 'package:yaha/yaha-box-sizes.dart';
import 'package:yaha/yaha-colors.dart';
import 'package:yaha/yaha-font-sizes.dart';
import 'package:yaha/yaha-space-sizes.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/widgets.dart';

import 'app-settings-state.dart';

// ignore: must_be_immutable
class ApplicationPage extends ConsumerWidget {
  int initialIndex = 0;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var appSettingsState = watch(applicationSettingsStateProvider);
    var appSettingsStateNotifier =
        watch(applicationSettingsStateProvider.notifier);
    var currentLanguage =
        ApplicationSettingsStateNotifier.isEnglish ? 'English' : 'Hungarian';

    return Scaffold(
      appBar: AppBar(
          backgroundColor: YahaColors.background,
          title: const Text('Application',
              style: TextStyle(
                  fontSize: YahaFontSizes.large,
                  fontWeight: FontWeight.w600,
                  color: YahaColors.textColor)),
          leading: IconButton(
            iconSize: YahaFontSizes.xxLarge,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: YahaColors.textColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: YahaSpaceSizes.general,
                              top: YahaSpaceSizes.medium,
                              bottom: YahaSpaceSizes.medium),
                          child: Text('Language',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.medium,
                                  fontWeight: FontWeight.w600,
                                  color: YahaColors.textColor)),
                          decoration: BoxDecoration(
                              color: YahaColors.tertiaryAccentColor),
                          height: 56.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: YahaSpaceSizes.general,
                              bottom: YahaSpaceSizes.general,
                              left: YahaSpaceSizes.large,
                              right: YahaSpaceSizes.large),
                          padding: const EdgeInsets.only(
                              left: YahaSpaceSizes.xSmall,
                              right: YahaSpaceSizes.xSmall),
                          width: YahaBoxSizes.buttonWidthBig,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: YahaBorderWidth.small,
                                color: YahaColors.textColor,
                              ),
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general)),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: ApplicationSettingsStateNotifier
                                    .currentLanguageTitle,
                                icon: const Icon(Icons.expand_more,
                                    size: YahaFontSizes.xxLarge),
                                style: const TextStyle(
                                    color: YahaColors.textColor,
                                    fontSize: YahaFontSizes.medium),
                                underline: Container(
                                  height: 0,
                                ),
                                items: <String>['English', 'Hungarian']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  var newLangState = newValue == 'English'
                                      ? ApplicationSettingsStateNotifier
                                          .isEnglish = true
                                      : ApplicationSettingsStateNotifier
                                          .isEnglish = false;
                                  appSettingsStateNotifier.updateLanguage(
                                      newLangState, newValue!);
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: YahaSpaceSizes.general,
                              top: YahaSpaceSizes.medium,
                              bottom: YahaSpaceSizes.medium),
                          child: Text('Metrics',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.medium,
                                  fontWeight: FontWeight.w600,
                                  color: YahaColors.textColor)),
                          decoration: BoxDecoration(
                              color: YahaColors.tertiaryAccentColor),
                          height: 56.0,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: YahaSpaceSizes.general,
                                          left: YahaSpaceSizes.large,
                                          bottom: YahaSpaceSizes.general),
                                      child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "Distance",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: YahaFontSizes.small,
                                                color: YahaColors.textColor),
                                          )),
                                    ),
                                    Container(
                                      // width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.only(
                                        left: YahaSpaceSizes.medium,
                                        right: YahaSpaceSizes.medium,
                                      ),
                                      child: ToggleSwitch(
                                        minWidth: YahaBoxSizes.toggleWidth,
                                        activeBgColor: [YahaColors.primary],
                                        inactiveBgColor: YahaColors.accentColor,
                                        initialLabelIndex:
                                            ApplicationSettingsStateNotifier
                                                .distanceInitialIndex,
                                        totalSwitches: 2,
                                        labels: ['km', 'mile'],
                                        onToggle: (index) {
                                          var newDistanceFormatState = index ==
                                                  0
                                              ? ApplicationSettingsStateNotifier
                                                  .isKm = true
                                              : ApplicationSettingsStateNotifier
                                                  .isKm = false;

                                          appSettingsStateNotifier
                                              .updateDistanceFormat(
                                                  newDistanceFormatState,
                                                  index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: YahaSpaceSizes.large,
                                          left: YahaSpaceSizes.large,
                                          bottom: YahaSpaceSizes.general),
                                      child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "Temperature",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: YahaFontSizes.small,
                                                color: YahaColors.textColor),
                                          )),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: YahaSpaceSizes.medium,
                                          right: YahaSpaceSizes.medium),
                                      child: ToggleSwitch(
                                        minWidth: YahaBoxSizes.toggleWidth,
                                        activeBgColor: [YahaColors.primary],
                                        inactiveBgColor: YahaColors.accentColor,
                                        initialLabelIndex:
                                            ApplicationSettingsStateNotifier
                                                .temperatureInitialIndex,
                                        totalSwitches: 2,
                                        labels: ['Celsius', 'Fahrenheit'],
                                        onToggle: (index) {
                                          var newTemperatureFormatState = index ==
                                                  0
                                              ? ApplicationSettingsStateNotifier
                                                  .isCelsius = true
                                              : ApplicationSettingsStateNotifier
                                                  .isCelsius = false;
                                          appSettingsStateNotifier
                                              .updateTemperatureFormat(
                                                  newTemperatureFormatState,
                                                  index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: YahaSpaceSizes.large,
                                          left: YahaSpaceSizes.large,
                                          bottom: YahaSpaceSizes.general),
                                      child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "Time Format",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: YahaFontSizes.small,
                                                color: YahaColors.textColor),
                                          )),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: YahaSpaceSizes.medium,
                                          right: YahaSpaceSizes.medium,
                                          bottom: YahaSpaceSizes.general),
                                      child: ToggleSwitch(
                                        minWidth: YahaBoxSizes.toggleWidth,
                                        activeBgColor: [YahaColors.primary],
                                        inactiveBgColor: YahaColors.accentColor,
                                        initialLabelIndex:
                                            ApplicationSettingsStateNotifier
                                                .timeFormatInitialIndex,
                                        totalSwitches: 2,
                                        labels: ['12h', '24h'],
                                        onToggle: (index) {
                                          var newTimeFormatState = index == 0
                                              ? ApplicationSettingsStateNotifier
                                                  .isTimeFormat24 = true
                                              : ApplicationSettingsStateNotifier
                                                  .isTimeFormat24 = false;
                                          appSettingsStateNotifier
                                              .updateTimeFormat(
                                                  newTimeFormatState, index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
