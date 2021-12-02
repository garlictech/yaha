import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/hike/hike-outline/settings/poi-filters-list.dart';
import 'package:yaha/presenters/track/tracking-timeline-customize-widget-presenter.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class TrackingTimelineCustomizeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(trackingTimelineCustomizeWidgetMVPProvider);
    final presenter =
        watch(trackingTimelineCustomizeWidgetMVPProvider.notifier);

    return Material(
      child: Padding(
        padding: EdgeInsets.only(
          top: YahaSpaceSizes.large,
          right: YahaSpaceSizes.general,
          bottom: YahaSpaceSizes.large,
          left: YahaSpaceSizes.general,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Show POIs between checkpoints',
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    color: YahaColors.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Switch.adaptive(
                  value: viewModel.showPois,
                  onChanged: presenter.togglePoiSwitch(),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                top: YahaSpaceSizes.medium,
                bottom: YahaSpaceSizes.xxSmall,
              ),
              child: Row(
                children: [
                  Text(
                    'Show natural phenomenons',
                    style: TextStyle(
                      fontSize: YahaFontSizes.small,
                      color: YahaColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.help_rounded),
                      color: YahaColors.primary,
                      iconSize: YahaIconSizes.small,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: YahaSpaceSizes.general),
              child: Row(
                children: [
                  Text(
                    'Show TimeCapsules',
                    style: TextStyle(
                      fontSize: YahaFontSizes.small,
                      color: YahaColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.help_rounded),
                      color: YahaColors.primary,
                      iconSize: YahaIconSizes.small,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'POI categories',
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    color: YahaColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
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
              child: PoiFiltersList(),
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
                  onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
