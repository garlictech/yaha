import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/poi/widgets/poi-icon.dart';
import 'package:yaha/ui/views/shared/shared.dart';
import 'package:yaha/domain/entities/entities.dart';
import 'package:yaha/app/providers.dart';

import '../../shared/widgets/yaha-image.dart';

class PoiListItem extends ConsumerWidget {
  final Poi poi;
  final double cardHeight;

  const PoiListItem({Key? key, required this.poi, required this.cardHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesOfPoi = ref.watch(imagesOfPoiProvider(poi.id));
    const spacing = YahaSpaceSizes.xSmall;

    textContent(double fontSize) {
      return Row(children: [
        SizedBox(height: 30, width: 30, child: PoiIcon(poiType: poi.poiType)),
        Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: spacing, right: spacing),
                    child: Text(poi.title.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(fontSize: fontSize),
                        textAlign: TextAlign.start))))
      ]);
    }

    return imagesOfPoi.when(
      error: (e, s) => textContent(YahaFontSizes.small),
      loading: () => textContent(YahaFontSizes.small),
      data: (imageUrls) => Row(children: [
        Expanded(
            child: textContent(imageUrls.isNotEmpty
                ? YahaFontSizes.xSmall
                : YahaFontSizes.small)),
        if (imageUrls.isNotEmpty)
          SizedBox(
              height: cardHeight,
              width: cardHeight,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(YahaBorderRadius.xSmall),
                  child: YahaImage(imageUrl: imageUrls.first)))
      ]),
    );
  }
}
