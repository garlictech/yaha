import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/hikes/map/widgets/pois-of-hike-map.dart';
import 'package:yaha/domain/domain.dart';
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
    const textColor = YahaColors.textColor;

    return Scaffold(
        appBar: AppBar(
            leading: const YahaBackButton(color: textColor),
            backgroundColor: Colors.black.withOpacity(0.2),
            elevation: 0,
            centerTitle: true,
            title: Padding(
                padding: const EdgeInsets.only(right: 45.0),
                child: YahaScreenHeadTitleText(
                    text: hike.title, color: textColor))),
        extendBodyBehindAppBar: true,
        body: PoisOfHikeMap(key: UniqueKey(), hike: hike));
  }
}
