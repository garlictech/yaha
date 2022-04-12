import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/providers/poi-providers.dart';

import '../../shared/shared.dart';
import 'poi-icon.dart';

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
            .map((type) => PoiIcon(
                  poiType: type,
                ))
            .toList());
  }
}
