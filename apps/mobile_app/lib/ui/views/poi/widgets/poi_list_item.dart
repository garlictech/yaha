import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/poi/widgets/poi-icon.dart';
import 'package:yaha/ui/views/shared/shared.dart';
import 'package:yaha/domain/entities/entities.dart';

class PoiListItem extends ConsumerWidget {
  final PoiOfHike poi;
  final double cardHeight;

  const PoiListItem({Key? key, required this.poi, required this.cardHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const spacing = YahaSpaceSizes.xSmall;

    getFuture(future, label) {
      return FutureBuilder(
          future: future,
          builder: (context, data) {
            return Text("$label: ${data.data}", textAlign: TextAlign.left);
          });
    }

    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
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
                            child: Text(poi.title.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: const TextStyle(
                                    fontSize: YahaFontSizes.xSmall),
                                textAlign: TextAlign.start))))
              ])),
          Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getFuture(poi.distanceFromStartStr, "D"),
                    getFuture(poi.durationStr, "T"),
                    getFuture(poi.arrivalStr, "A"),
                  ]))
        ]);
  }
}
