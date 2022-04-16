import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/providers/providers.dart';

import '../../map/widgets/pois-of-hike-map.dart';
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
        builder: (BuildContext context,
                AsyncSnapshot<List<PoiOfHike>> snapshot) =>
            Column(children: [
              Container(
                  height: 240,
                  margin: const EdgeInsets.only(bottom: YahaSpaceSizes.large),
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(YahaBorderRadius.general),
                    child: PoisOfHikeMap(pois: snapshot.data ?? [], hike: hike),
                  )),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                            height: 100,
                            child: PlacesOnRouteItem(
                                poi: snapshot.data![index],
                                distanceFromStart: snapshot
                                        .data![index].distanceFromStartSync ??
                                    0));
                      }))
            ]));

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
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: YahaSpaceSizes.general),
              child: listItems),
        ));
  }
}
