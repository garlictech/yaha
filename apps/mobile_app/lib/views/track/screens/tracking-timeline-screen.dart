import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yaha/hike/hike-outline/checkpoint.dart';
import 'package:yaha/hike/hike-outline/route-section.dart';
import 'package:yaha/hike/hike-outline/views/widgets/timecapsule-on-hike-outline-widget.dart';
import 'package:yaha/hike/hike-outline/weather-astronomical-data.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/views/track/tracking-timeline-state.dart';
import 'package:yaha/views/track/widgets/tracking-rating-widget.dart';

class TrackingTimelineScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var trackingTimelineState = watch(trackingTimelineStateProvider);

    return Scaffold(
        body: trackingTimelineState.when(
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text('😱'),
            data: (state) => _createMainWidget(state)));
  }

  _createMainWidget(TrackingTimelineScreenState state) {
    var nodes = state.nodeList.map((node) {
      if (node is CheckpointModel) {
        return Checkpoint(checkpointModel: node);
      } else if (node is RouteSectionModel) {
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
      physics: BouncingScrollPhysics(),
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
                                            padding: EdgeInsets.only(
                                              left: YahaSpaceSizes.small,
                                              right: YahaSpaceSizes.medium,
                                            ),
                                            color: YahaColors.accentColor,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Align(
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
                                                    child: Icon(
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
                                            child: TrackingRatingWidget(),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                icon: Icon(
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
                                icon: Icon(
                                  Icons.warning_rounded,
                                  size: YahaIconSizes.large,
                                  color: YahaColors.textColor,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings_rounded,
                                size: YahaIconSizes.medium,
                                color: YahaColors.textColor,
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
