import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/hike/hike-outline/route-section.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/buttons/filter-button.dart';
import 'package:yaha/utility/buttons/settings-button.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:dotted_line/dotted_line.dart';

import 'checkpoint.dart';
import 'hike-outline-state.dart';

class HikeOutlinePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var hikeOutlineState = watch(hikeOutlineStateProvider);

    return Scaffold(
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
          direction: Axis.vertical,
          lineLength: 50.0,
          lineThickness: 4.0,
          dashRadius: 20.0,
          dashGapLength: 5.0,
          dashColor: YahaColors.textColor,
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
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: YahaSpaceSizes.medium,
                        right: YahaSpaceSizes.medium,
                        top: YahaSpaceSizes.small,
                        bottom: YahaSpaceSizes.large,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: YahaBackButton(),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text('Hike Outline',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: YahaFontSizes.large,
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.textColor)),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SettingsButton(),
                          ),
                          Positioned(
                            right: 55.0,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FilterButton(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...nodes
                  ],
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
