import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/domain.dart';
import '../../shared/shared.dart';
import 'poi-icon.dart';

class PoiTitleList extends ConsumerWidget {
  final List<Poi>? pois;

  const PoiTitleList({Key? key, required this.pois}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> children = [const CircularProgressIndicator()];

    if (pois != null) {
      children = pois!.map((poi) {
        return Container(
          padding: const EdgeInsets.only(top: YahaSpaceSizes.medium),
          child: Row(
            children: [
              PoiIcon(poiType: poi.poiType),
              Container(
                padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
                child: Text(poi.description?.first.title ?? poi.poiType.kind,
                    style: const TextStyle(
                        fontSize: YahaFontSizes.small,
                        color: YahaColors.textColor)),
              ),
            ],
          ),
        );
      }).toList();
    }

    return Column(children: children);
  }
}
