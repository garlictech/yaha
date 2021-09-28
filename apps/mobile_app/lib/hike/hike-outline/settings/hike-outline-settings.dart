import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/settings/application/app-settings-state.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/utility/yaha-text-input.dart';

class HikeOutlineSettings extends ConsumerWidget {
  final startTimeController = TextEditingController();
  final averageSpeedController = TextEditingController();
  final finishTimeController = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var appSettingsStateNotifier =
        watch(applicationSettingsStateProvider.notifier);

    return Container(
      padding: EdgeInsets.only(
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
                  constraints: BoxConstraints(
                    maxWidth: 330.0,
                  ),
                  child: YahaTextField(
                    title: 'Start',
                    controller: startTimeController,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: YahaSpaceSizes.small),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.help_rounded),
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
                  constraints: BoxConstraints(maxWidth: 330.0),
                  padding: EdgeInsets.only(
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
                padding: EdgeInsets.only(left: YahaSpaceSizes.small),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.help_rounded),
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
                  constraints: BoxConstraints(maxWidth: 330.0),
                  child: YahaTextField(
                    title: "Finish",
                    controller: finishTimeController,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: YahaSpaceSizes.small),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.help_rounded),
                  color: YahaColors.primary,
                  iconSize: YahaIconSizes.small,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: YahaSpaceSizes.xLarge),
            child: SizedBox(
              height: YahaBoxSizes.buttonHeight,
              width: YahaBoxSizes.buttonWidthBig,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.save_rounded,
                  color: YahaColors.accentColor,
                  size: YahaFontSizes.large,
                ),
                onPressed: () {
                  appSettingsStateNotifier.updatestartTime(startTimeController.text);
                },
                label: Text('Save',
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
