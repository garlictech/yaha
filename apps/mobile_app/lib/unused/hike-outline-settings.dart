import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/shared/shared.dart';

import '../ui/views/hikes/personal/screen/app-settings-state.dart';

class HikeOutlineSettings extends ConsumerWidget {
  final startTimeController = TextEditingController();
  final averageSpeedController = TextEditingController();
  final finishTimeController = TextEditingController();
  final DateTime dateTime = DateTime.now();

  HikeOutlineSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appSettingsState = ref.watch(applicationSettingsStateProvider);
    var appSettingsStateNotifier =
        ref.watch(applicationSettingsStateProvider.notifier);

    return Container(
      padding: const EdgeInsets.only(
        top: YahaSpaceSizes.large,
        right: YahaSpaceSizes.general,
        bottom: YahaSpaceSizes.large,
        left: YahaSpaceSizes.general,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 330.0,
                  ),
                  child: TextFormField(
                    controller: startTimeController,
                    onTap: () => appSettingsStateNotifier
                        .updateStartTimePickerVisibility(true),
                    onEditingComplete: () => appSettingsStateNotifier
                        .updateStartTimePickerVisibility(false),
                    keyboardType: TextInputType.text,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: YahaColors.textColor,
                        fontSize: YahaFontSizes.small),
                    decoration: InputDecoration(
                      focusColor: YahaColors.military,
                      labelText: appSettingsState.startTime.toString(),
                      labelStyle: const TextStyle(color: YahaColors.textColor),
                      contentPadding:
                          const EdgeInsets.only(left: YahaSpaceSizes.medium),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                          borderSide: const BorderSide(
                              color: YahaColors.textColor,
                              width: YahaBorderWidth.xSmall)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                          borderSide: const BorderSide(
                              color: YahaColors.primary,
                              width: YahaBorderWidth.xSmall)),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.help_rounded),
                  color: YahaColors.primary,
                  iconSize: YahaIconSizes.small,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: YahaSpaceSizes.small),
            child: Visibility(
              visible: appSettingsState.startTimePickerVisibility,
              child: SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: dateTime,
                  mode: CupertinoDatePickerMode.dateAndTime,
                  onDateTimeChanged: (newDateTime) =>
                      appSettingsStateNotifier.updateStartTime(newDateTime),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 330.0),
                  padding: const EdgeInsets.only(
                    top: YahaSpaceSizes.general,
                    bottom: YahaSpaceSizes.general,
                  ),
                  child: YahaTextField(
                    title: 'Average speed',
                    controller: averageSpeedController,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.help_rounded),
                  color: YahaColors.primary,
                  iconSize: YahaIconSizes.small,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: YahaSpaceSizes.small),
                  constraints: const BoxConstraints(maxWidth: 330.0),
                  child: TextFormField(
                    controller: finishTimeController,
                    onTap: () => appSettingsStateNotifier
                        .updateFinishTimePickerVisibility(true),
                    onEditingComplete: () => appSettingsStateNotifier
                        .updateFinishTimePickerVisibility(false),
                    keyboardType: TextInputType.text,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: YahaColors.textColor,
                        fontSize: YahaFontSizes.small),
                    decoration: InputDecoration(
                      focusColor: YahaColors.military,
                      labelText: appSettingsState.finishTime.toString(),
                      labelStyle: const TextStyle(color: YahaColors.textColor),
                      contentPadding:
                          const EdgeInsets.only(left: YahaSpaceSizes.medium),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                          borderSide: const BorderSide(
                              color: YahaColors.textColor,
                              width: YahaBorderWidth.xSmall)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                          borderSide: const BorderSide(
                              color: YahaColors.primary,
                              width: YahaBorderWidth.xSmall)),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.help_rounded),
                  color: YahaColors.primary,
                  iconSize: YahaIconSizes.small,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: YahaSpaceSizes.small),
            child: Visibility(
              visible: appSettingsState.finishTimePickerVisibility,
              child: SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: dateTime,
                  mode: CupertinoDatePickerMode.dateAndTime,
                  onDateTimeChanged: (newDateTime) =>
                      appSettingsStateNotifier.updateFinishTime(newDateTime),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: YahaSpaceSizes.xLarge),
            child: SizedBox(
              height: YahaBoxSizes.buttonHeight,
              width: YahaBoxSizes.buttonWidthBig,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.save_rounded,
                  color: YahaColors.accentColor,
                  size: YahaFontSizes.large,
                ),
                onPressed: () {
                  appSettingsStateNotifier
                      .updateAverageHikingSpeed(averageSpeedController.text);
                },
                label: const Text('Save',
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
      ),
    );
  }
}
