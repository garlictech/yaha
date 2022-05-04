import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import '../../map/widgets/pois-of-hike-map.dart';
import '../../shared/shared.dart';
import '../widgets/poi_list_tile_widget.dart';

class PlacesOnRouteItem extends StatelessWidget {
  final Poi poi;
  final double distanceFromStart;

  const PlacesOnRouteItem(
      {Key? key, required this.poi, required this.distanceFromStart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      PoiListTileWidget(
        poi: poi,
        title: poi.title,
        distanceFromStart: distanceFromStart,
      ),
      const Padding(
        padding: EdgeInsets.only(
            top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.small),
        child: Divider(
            color: YahaColors.divider, thickness: YahaBorderWidth.xxSmall),
      )
    ]);
  }
}

class PlacesOnRouteScreen extends ConsumerWidget {
  final Hike hike;

  const PlacesOnRouteScreen({Key? key, required this.hike}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: YahaColors.background,
          elevation: 0,
          title: const Text(
            'Most interesting places on route',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: YahaFontSizes.medium,
              color: YahaColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: const YahaBackButton(),
        ),
        body: SafeArea(child: PoisOfHikeMap(key: UniqueKey(), hike: hike)));
  }
}
