import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app-settings-state.dart';

// ignore: must_be_immutable
class ApplicationScreen extends ConsumerWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appSettingsState = ref.watch(applicationSettingsStateProvider);
    var appSettingsStateNotifier =
        ref.watch(applicationSettingsStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: YahaColors.background,
          title: const Text('Application',
              style: TextStyle(
                  fontSize: YahaFontSizes.medium,
                  fontWeight: FontWeight.w600,
                  color: YahaColors.textColor)),
          leading: IconButton(
            iconSize: YahaFontSizes.xxLarge,
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: YahaColors.textColor,
              size: YahaIconSizes.medium,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                            left: YahaSpaceSizes.general,
                            top: YahaSpaceSizes.medium,
                            bottom: YahaSpaceSizes.medium),
                        child: const Text('Language',
                            style: TextStyle(
                                fontSize: YahaFontSizes.medium,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor)),
                        decoration:
                            const BoxDecoration(color: YahaColors.accentColor),
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
                        height: YahaBoxSizes.buttonHeight,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: YahaBorderWidth.xSmall,
                              color: YahaColors.textColor,
                            ),
                            borderRadius: BorderRadius.circular(
                                YahaBorderRadius.general)),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: appSettingsState.currentLanguageTitle,
                              icon: const Icon(Icons.expand_more,
                                  size: YahaFontSizes.xxLarge),
                              style: const TextStyle(
                                  color: YahaColors.textColor,
                                  fontSize: YahaFontSizes.small),
                              underline: Container(
                                height: 0,
                              ),
                              items: <String>['English', 'Hungarian']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                var newLangState =
                                    newValue == 'English' ? true : false;
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
                        child: const Text('Metrics',
                            style: TextStyle(
                                fontSize: YahaFontSizes.medium,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor)),
                        decoration:
                            const BoxDecoration(color: YahaColors.accentColor),
                        height: 56.0,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: YahaSpaceSizes.general,
                                        left: YahaSpaceSizes.large,
                                        bottom: YahaSpaceSizes.general),
                                    child: const SizedBox(
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
                                    padding: const EdgeInsets.only(
                                      left: YahaSpaceSizes.medium,
                                      right: YahaSpaceSizes.medium,
                                    ),
                                    child: ToggleSwitch(
                                      minWidth: YahaBoxSizes.toggleWidth,
                                      activeBgColor: const [YahaColors.primary],
                                      inactiveBgColor: YahaColors.accentColor,
                                      initialLabelIndex:
                                          appSettingsState.distanceInitialIndex,
                                      totalSwitches: 2,
                                      labels: const ['km', 'mile'],
                                      onToggle: (index) {
                                        var newDistanceFormatState =
                                            index == 0 ? true : false;

                                        appSettingsStateNotifier
                                            .updateDistanceFormat(
                                                newDistanceFormatState,
                                                index ?? 0);
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
                                    padding: const EdgeInsets.only(
                                        top: YahaSpaceSizes.large,
                                        left: YahaSpaceSizes.large,
                                        bottom: YahaSpaceSizes.general),
                                    child: const SizedBox(
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
                                      activeBgColor: const [YahaColors.primary],
                                      inactiveBgColor: YahaColors.accentColor,
                                      initialLabelIndex: appSettingsState
                                          .temperatureInitialIndex,
                                      totalSwitches: 2,
                                      labels: const ['Celsius', 'Fahrenheit'],
                                      onToggle: (index) {
                                        var newTemperatureFormatState =
                                            index == 0 ? true : false;
                                        appSettingsStateNotifier
                                            .updateTemperatureFormat(
                                                newTemperatureFormatState,
                                                index ?? 0);
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
                                    padding: const EdgeInsets.only(
                                        top: YahaSpaceSizes.large,
                                        left: YahaSpaceSizes.large,
                                        bottom: YahaSpaceSizes.general),
                                    child: const SizedBox(
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
                                      activeBgColor: const [YahaColors.primary],
                                      inactiveBgColor: YahaColors.accentColor,
                                      initialLabelIndex: appSettingsState
                                          .timeFormatInitialIndex,
                                      totalSwitches: 2,
                                      labels: const ['12h', '24h'],
                                      onToggle: (index) {
                                        var newTimeFormatState =
                                            index == 0 ? true : false;
                                        appSettingsStateNotifier
                                            .updateTimeFormat(
                                                newTimeFormatState, index ?? 0);
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
