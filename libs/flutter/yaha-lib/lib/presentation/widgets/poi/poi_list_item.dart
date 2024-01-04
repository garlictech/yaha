import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/entities/entities.dart';

import '../shared/shared.dart';
import 'poi-icon.dart';

class PoiListItem extends ConsumerWidget {
  final PoiOfHikeEntity poi;

  const PoiListItem({super.key, required this.poi});

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
                    Expanded(
                        child: Row(children: [
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
                                  child: AutoSizeText(poi.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: const TextStyle(
                                          fontSize: YahaFontSizes.xSmall),
                                      textAlign: TextAlign.start))))
                    ])),
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
