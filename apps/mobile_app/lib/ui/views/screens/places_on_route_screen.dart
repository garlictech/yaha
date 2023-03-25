import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/map/pois-of-hike-map.dart';
import 'package:yaha/domain/domain.dart';
import '../shared/shared.dart';

class PlacesOnRouteScreen extends ConsumerWidget {
  final Hike hike;
  final List<PoiType>? filteredPoiTypes;

  const PlacesOnRouteScreen(
      {Key? key, this.filteredPoiTypes, required this.hike})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textColor = YahaColors.textColor;

    return Scaffold(
        appBar: AppBar(
            leading: const YahaBackButton(),
            backgroundColor: Colors.black.withOpacity(0.2),
            elevation: 0,
            centerTitle: true,
            title: Padding(
                padding: const EdgeInsets.only(right: 45.0),
                child: YahaScreenHeadTitleText(
                    text: hike.title, color: textColor))),
        extendBodyBehindAppBar: true,
        body: PoisOfHikeMap(
            key: UniqueKey(), hike: hike, filteredPoiTypes: filteredPoiTypes));
  }
}
