import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/hike/hike-screen/most-interesting-place-on-route/place-widget.dart';
import 'package:yaha/hike/hike-screen/most-interesting-place-on-route/places-on-route-state.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class PlacesOnRouteScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var placesOnRouteState = watch(placesOnRouteStateProvider);

    return Scaffold(
        body: placesOnRouteState.when(
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text('😱'),
            data: (state) => _createMainWidget(state)));
  }

  _createMainWidget(PlacesOnRouteState state) {
    var nodes = state.nodeList.map((node) {
      if (node is PlaceWidget) {
        return Padding(
          padding: const EdgeInsets.only(
              left: YahaSpaceSizes.general, right: YahaSpaceSizes.general),
          child: PlaceWidget(
            poiColor: node.poiColor,
            poiIcon: node.poiIcon,
            title: node.title,
            distanceFromStart: node.distanceFromStart,
          ),
        );
      } else if (node is Padding) {
        return Padding(
          padding: const EdgeInsets.only(
              top: YahaSpaceSizes.small,
              bottom: YahaSpaceSizes.small,
              left: YahaSpaceSizes.general,
              right: YahaSpaceSizes.general),
          child: Divider(
              color: YahaColors.divider, thickness: YahaBorderWidth.xxSmall),
        );
      } else {
        throw "Wrong data";
      }
    });

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: YahaSpaceSizes.large),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: YahaBackButton(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Most interesting places\non route',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: YahaFontSizes.medium,
                                  color: YahaColors.textColor,
                                  fontWeight: FontWeight.w600,
                                ),
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
      ),
    );
  }
}