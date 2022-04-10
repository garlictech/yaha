import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/shared.dart';
import 'places-on-route-state.dart';
import 'poi-list-tile-widget.dart';

class PlacesOnRouteScreen extends ConsumerWidget {
  const PlacesOnRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var placesOnRouteState = ref.watch(placesOnRouteStateProvider);

    return Scaffold(
        body: placesOnRouteState.when(
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => const Text('😱'),
            data: (state) => _createMainWidget(state)));
  }

  _createMainWidget(PlacesOnRouteState state) {
    var nodes = state.nodeList.map((node) {
      if (node is PoiListTileWidget) {
        return PoiListTileWidget(
          poiColor: node.poiColor,
          poiIcon: node.poiIcon,
          title: node.title,
          distanceFromStart: node.distanceFromStart,
        );
      } else if (node is Padding) {
        return const Padding(
          padding: EdgeInsets.only(
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
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: const Text(
          'Most interesting places\non route',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: YahaFontSizes.medium,
            color: YahaColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: YahaBackButton(),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
      ),
    );
  }
}