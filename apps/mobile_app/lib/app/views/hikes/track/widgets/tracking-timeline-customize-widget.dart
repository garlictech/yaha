import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/presenters/track/tracking-timeline-customize-widget-presenter.dart';
import 'package:yaha/app/views/poi/widgets/poi-filters-list.dart';

import '../../../shared/shared.dart';

class TrackingTimelineCustomizeWidget extends ConsumerWidget {
  const TrackingTimelineCustomizeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(trackingTimelineCustomizeWidgetMVPProvider);
    final presenter =
        ref.watch(trackingTimelineCustomizeWidgetMVPProvider.notifier);

    return Material(
      child: Padding(
        padding: const EdgeInsets.only(
          top: YahaSpaceSizes.general,
          right: YahaSpaceSizes.general,
          bottom: YahaSpaceSizes.large,
          left: YahaSpaceSizes.general,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Show POIs between checkpoints',
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    color: YahaColors.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Switch.adaptive(
                  value: viewModel.showPois,
                  onChanged: (_value) => presenter.togglePoiSwitch(),
                  activeColor: YahaColors.primary,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                top: YahaSpaceSizes.xSmall,
                bottom: YahaSpaceSizes.xSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Show natural phenomenons',
                        style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          color: YahaColors.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.help_rounded),
                        color: YahaColors.primary,
                        iconSize: YahaIconSizes.small,
                      ),
                    ],
                  ),
                  Switch.adaptive(
                    value: viewModel.showNaturalPhenomenons,
                    onChanged: (_value) =>
                        presenter.toggleNaturalPhenomenonsSwitch(),
                    activeColor: YahaColors.primary,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: YahaSpaceSizes.general),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Show TimeCapsules',
                        style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          color: YahaColors.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.help_rounded),
                        color: YahaColors.primary,
                        iconSize: YahaIconSizes.small,
                      ),
                    ],
                  ),
                  Switch.adaptive(
                    value: viewModel.showTimeCapsules,
                    onChanged: (_value) => presenter.toggleTimeCapsulesSwitch(),
                    activeColor: YahaColors.primary,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Text(
                  'POI categories',
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    color: YahaColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.help_rounded),
                  color: YahaColors.primary,
                  iconSize: YahaIconSizes.small,
                ),
              ],
            ),
            const PoiFiltersList(),
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
                  onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
