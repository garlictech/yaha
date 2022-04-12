import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import '../../hikes/screens/poi-summary.dart';
import '../../shared/shared.dart';
import 'poi-icon.dart';

class PoiTitleList extends ConsumerWidget {
  final List<Poi> pois;

  const PoiTitleList({Key? key, required this.pois}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        children: pois.map((poi) {
      final relevantTag = poi.poiTypes
          ?.where((type) => {
                'tourism',
                'natural',
                'leisure',
                'historic',
                'sight'
              }.contains(type.category))
          .toList()
          .first;

      return Container(
        padding: const EdgeInsets.only(top: YahaSpaceSizes.medium),
        child: Row(
          children: [
            PoiIcon(poiType: relevantTag),
            Container(
              padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
              child: Text(
                  poi.description?.first.title ??
                      relevantTag?.kind ??
                      'a thing',
                  style: const TextStyle(
                      fontSize: YahaFontSizes.small,
                      color: YahaColors.textColor)),
            ),
          ],
        ),
      );
    }).toList());
  }
}
