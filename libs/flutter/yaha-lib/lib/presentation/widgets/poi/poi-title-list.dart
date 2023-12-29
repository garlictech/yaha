import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../shared/shared.dart';
import 'poi-icon.dart';

class PoiTitleList extends StatelessWidget {
  final List<PoiEntity> pois;

  const PoiTitleList({Key? key, required this.pois}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: pois.map((poi) {
      return Container(
        padding: const EdgeInsets.only(top: YahaSpaceSizes.medium),
        child: Row(
          children: [
            SizedBox(
                height: 40, width: 40, child: PoiIcon(poiType: poi.poiType)),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
              child:
                  Text(poi.title, overflow: TextOverflow.ellipsis, maxLines: 2),
            )),
          ],
        ),
      );
    }).toList());
  }
}
