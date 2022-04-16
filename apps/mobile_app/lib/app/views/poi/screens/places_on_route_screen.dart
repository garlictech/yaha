import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/streams.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/providers/providers.dart';

import '../../poi/poi.dart';
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
        poiIcon: PoiIcon(poiType: poi.poiType),
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
    final pois = ref
        .watch(poisAlongHikeUsecasesProvider(hike.id)
            .select((notifier) => notifier.touristicPoisSortedByDistance))
        .first;

    var listItems = FutureBuilder<List<PoiOfHike>>(
        future: pois,
        builder:
            (BuildContext context, AsyncSnapshot<List<PoiOfHike>> snapshot) =>
                Column(
                    children: (snapshot.data ?? [])
                        .map<Widget>((poi) => PlacesOnRouteItem(
                            poi: poi,
                            distanceFromStart: poi.distanceFromStartSync ?? 0))
                        .toList()));

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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: YahaSpaceSizes.general),
                    child: listItems,
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
