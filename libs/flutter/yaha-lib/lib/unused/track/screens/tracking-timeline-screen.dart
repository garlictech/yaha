import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../shared/shared.dart';
import '../../hike/screens/checkpoint.dart';
import '../../hike/screens/route-section.dart';
import '../../hike/screens/timecapsule-on-hike-outline-widget.dart';
import '../../hike/screens/weather-astronomical-data.dart';
import '../tracking-timeline-state.dart';
import '../widgets/tracking-rating-widget.dart';
import '../widgets/tracking-timeline-customize-widget.dart';

class TrackingTimelineScreen extends ConsumerWidget {
  const TrackingTimelineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trackingTimelineState = ref.watch(trackingTimelineStateProvider);

    return Scaffold(
        body: trackingTimelineState.when(
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => const Text('😱'),
            data: (state) => _createMainWidget(state)));
  }

  _createMainWidget(TrackingTimelineScreenState state) {
    var nodes = state.nodeList.map((node) {
      /* if (node is CheckpointModel) {
        return Checkpoint(checkpointModel: node);
      } else*/
      if (node is RouteSectionModel) {
        return RouteSection(routeSectionModel: node);
      } else if (node is DottedLine) {
        return DottedLine(
          direction: node.direction,
          lineLength: node.lineLength,
          lineThickness: node.lineThickness,
          dashRadius: node.dashRadius,
          dashGapLength: node.dashGapLength,
          dashColor: node.dashColor,
        );
      } else if (node is WeatherAstronomicalData) {
        return WeatherAstronomicalData(
          icon: node.icon,
          text: node.text,
        );
      } else if (node is TimeCapsuleOnHikeOutlineScreen) {
        return TimeCapsuleOnHikeOutlineScreen(
          text: node.text,
        );
      } else {
        throw "Wrong data";
      }
    });

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: YahaSpaceSizes.general,
                      right: YahaSpaceSizes.general),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.medium,
                            bottom: YahaSpaceSizes.medium),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: IconButton(
                                onPressed: () => showBarModalBottomSheet(
                                  expand: false,
                                  backgroundColor: YahaColors.background,
                                  useRootNavigator: true,
                                  context: context,
                                  builder: (context) {
                                    return SingleChildScrollView(
                                      controller:
                                          ModalScrollController.of(context),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: YahaBoxSizes.heightXXXSmall,
                                            padding: const EdgeInsets.only(
                                              left: YahaSpaceSizes.small,
                                              right: YahaSpaceSizes.medium,
                                            ),
                                            color: YahaColors.accentColor,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                const Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Rating",
                                                    style: TextStyle(
                                                      fontSize:
                                                          YahaFontSizes.small,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          YahaColors.textColor,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Icon(
                                                      Icons.close_outlined,
                                                      color: YahaColors
                                                          .secondaryAccentColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: YahaColors.background,
                                            child: const TrackingRatingWidget(),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                icon: const Icon(
                                  Icons.rate_review_rounded,
                                  size: YahaIconSizes.medium,
                                  color: YahaColors.textColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: YahaSpaceSizes.medium,
                                  right: YahaSpaceSizes.medium,
                                  bottom: 1),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.warning_rounded,
                                  size: YahaIconSizes.large,
                                  color: YahaColors.textColor,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => showBarModalBottomSheet(
                                expand: false,
                                backgroundColor: YahaColors.background,
                                useRootNavigator: true,
                                context: context,
                                builder: (context) {
                                  return SingleChildScrollView(
                                    controller:
                                        ModalScrollController.of(context),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                            left: YahaSpaceSizes.small,
                                            right: YahaSpaceSizes.medium,
                                          ),
                                          color: YahaColors.accentColor,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: const Text("Reset"),
                                                  style: TextButton.styleFrom(
                                                    primary: YahaColors
                                                        .secondaryAccentColor,
                                                  ),
                                                ),
                                              ),
                                              const Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Customize timeline",
                                                  style: TextStyle(
                                                    fontSize:
                                                        YahaFontSizes.small,
                                                    fontWeight: FontWeight.w600,
                                                    color: YahaColors.textColor,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Icon(
                                                    Icons.close_outlined,
                                                    color: YahaColors
                                                        .secondaryAccentColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: YahaColors.background,
                                          child:
                                              const TrackingTimelineCustomizeWidget(),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              /*icon: Icon(
                                Icons.settings_rounded,
                                size: YahaIconSizes.medium,
                                color: YahaColors.textColor,
                              ),*/
                              icon: Image.asset(
                                'packages/flutter_yaha_lib/assets/images/filter-icon-filled.png',
                                width: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...nodes
                    ],
                  ),
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
