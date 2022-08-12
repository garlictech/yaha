import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/poi/widgets/poi-icon.dart';
import 'package:yaha/ui/views/shared/shared.dart';
import 'package:yaha/domain/entities/entities.dart';
import 'package:yaha/app/providers.dart';

class PoiListItem extends ConsumerWidget {
  final Poi poi;
  final double cardHeight;

  const PoiListItem({Key? key, required this.poi, required this.cardHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesOfPoi = ref.watch(imagesOfPoiProvider(poi.id));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Adding title and description for card.
        Expanded(
          flex: 2,
          child: Row(
            children: imagesOfPoi.when(
              error: (e, s) => [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
                    child: Text(poi.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: YahaFontSizes.small),
                        textAlign: TextAlign.start),
                  ),
                )
              ],
              loading: () => [
                Text(poi.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: YahaFontSizes.small),
                    textAlign: TextAlign.start)
              ],
              data: (imageUrls) => imageUrls.isEmpty
                  ? [
                      Text(poi.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: YahaFontSizes.small),
                          textAlign: TextAlign.start)
                    ]
                  : [
                      SizedBox(
                          height: 30,
                          width: 30,
                          child: PoiIcon(poiType: poi.poiType)),
                      Text(poi.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: YahaFontSizes.small),
                          textAlign: TextAlign.start)
                    ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: cardHeight - 10,
            width: cardHeight - 10,
            child: imagesOfPoi.when(
                loading: () => PoiIcon(poiType: poi.poiType),
                error: (err, val) => PoiIcon(poiType: poi.poiType),
                data: (imageUrls) {
                  return imageUrls.isEmpty
                      ? PoiIcon(poiType: poi.poiType)
                      : Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageUrls.first),
                                  fit: BoxFit.cover)));
                }),
          ),
        )
      ],
    );
  }
}
