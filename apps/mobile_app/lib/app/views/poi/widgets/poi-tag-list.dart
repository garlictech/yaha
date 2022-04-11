import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/providers/poi-providers.dart';

import '../../hikes/widgets/poi-filters.dart';
import '../../shared/shared.dart';

class PoiTagList extends ConsumerWidget {
  final String hikeId;
  const PoiTagList({Key? key, required this.hikeId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(poisAlongHikeNotifierProvider(hikeId)
        .select((notifier) => notifier.typeList));

    return Wrap(
        direction: Axis.horizontal,
        spacing: YahaSpaceSizes.medium,
        runSpacing: YahaSpaceSizes.xSmall,
        alignment: WrapAlignment.start,
        children: types
            .map((type) => PoiFilters(
                  backgroundColor: _getColor(type.category),
                  poiType: type,
                  title: type.kind.replaceAll('_', ' '),
                ))
            .toList());
  }

  _getColor(String category) {
    return PoiTagList._colorMap[category] ?? const Color(0xff00ff00);
  }

  static const _colorMap = {
    "natural": Color(0xff108E4C),
    "amenity": Color(0xff265DB2),
    "public_ransport": Color(0xff9D7050),
    "emergency": Color(0xffBF3638),
    "historic": Color(0xff8D4EB8),
    "leisure": Color(0xffFF8A21),
    "man_made": Color(0xffC259B5),
    "military": Color(0xffA8A8A8),
    "shop": Color(0xff5DC8BD),
    "tourism": Color(0xff66C547),
    "generic": Color(0xffFF8C00)
  };
}
