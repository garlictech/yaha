import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/poi/poi-icon.dart';
import 'package:yaha/ui/views/shared/shared.dart';
import 'package:yaha/domain/entities/entities.dart';

class WeatherListItem extends ConsumerWidget {
  final PoiOfHike poi;

  const WeatherListItem({Key? key, required this.poi}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const spacing = YahaSpaceSizes.xSmall;

    getFuture(future, IconData icon) {
      const fontSize = YahaFontSizes.xSmall;

      return FutureBuilder(
          future: future,
          builder: (context, data) {
            return Row(children: [
              Padding(
                  padding: const EdgeInsets.only(right: YahaSpaceSizes.xSmall),
                  child: Icon(icon, size: fontSize + 2)),
              Text("${data.data}".toUpperCase(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: fontSize))
            ]);
          });
    }

    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      SizedBox(
                          height: 30,
                          width: 30,
                          child: PoiIcon(poiType: poi.poiType)),
                      Expanded(
                          flex: 2,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: spacing, right: spacing),
                                  child: Text(poi.title.toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: const TextStyle(
                                          fontSize: YahaFontSizes.xSmall),
                                      textAlign: TextAlign.start))))
                    ]),
                    if (poi.hasOwnTitle)
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(poi.kindAsStr.toUpperCase(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: YahaFontSizes.xxSmall)))
                  ])),
          Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getFuture(poi.distanceFromStartStr, Icons.directions_walk),
                    getFuture(poi.durationStr, Icons.timer_rounded),
                    getFuture(poi.arrivalStr, Icons.access_time),
                  ]))
        ]);
  }
}
