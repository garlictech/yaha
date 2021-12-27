import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yaha/hike/hike-outline/route-section.dart';
import 'package:yaha/hike/hike-outline/settings/hike-outline-filters.dart';
import 'package:yaha/hike/hike-outline/settings/hike-outline-settings.dart';
import 'package:yaha/hike/hike-outline/views/widgets/timecapsule-on-hike-outline-widget.dart';
import 'package:yaha/hike/hike-outline/weather-astronomical-data.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:dotted_line/dotted_line.dart';

import 'checkpoint.dart';
import 'hike-outline-state.dart';

class HikeOutlineScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var hikeOutlineState = watch(hikeOutlineStateProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: YahaColors.background,
          elevation: 0,
          title: Text(
            'Hike Outline',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: YahaFontSizes.medium,
              color: YahaColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: YahaBackButton(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: YahaSpaceSizes.xSmall),
              child: IconButton(
                onPressed: () => showBarModalBottomSheet(
                  expand: false,
                  backgroundColor: YahaColors.background,
                  useRootNavigator: true,
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      controller: ModalScrollController.of(context),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
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
                                    child: Text("Reset"),
                                    style: TextButton.styleFrom(
                                      primary: YahaColors.secondaryAccentColor,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Customize hike outline",
                                    style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.close_outlined,
                                      color: YahaColors.secondaryAccentColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: YahaColors.background,
                            child: HikeOutlineFilters(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                icon: Image.asset(
                  'assets/images/filter-icon-filled.png',
                  width: 24.0,
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
                    controller: ModalScrollController.of(context),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
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
                                  child: Text("Reset"),
                                  style: TextButton.styleFrom(
                                    primary: YahaColors.secondaryAccentColor,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Customize hike",
                                  style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.textColor,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.close_outlined,
                                    color: YahaColors.secondaryAccentColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: YahaColors.background,
                          child: HikeOutlineSettings(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              icon: Icon(
                Icons.settings_rounded,
                size: 28.0,
                color: YahaColors.textColor,
              ),
            ),
          ],
        ),
        body: hikeOutlineState.when(
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text('😱'),
            data: (state) => _createMainWidget(state)));
  }

  _createMainWidget(HikeOutlineState state) {
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
                  padding: const EdgeInsets.only(top: YahaSpaceSizes.general),
                  child: Column(
                    children: [...nodes],
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
