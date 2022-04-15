import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';

import '../../shared/shared.dart';
import 'poi-icon.dart';

class PoiIconList extends ConsumerWidget {
  final List<PoiType>? types;
  const PoiIconList({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> children = [const CircularProgressIndicator()];

    if (types != null) {
      children = types!
          .map((type) => Tooltip(
              message: type.kind.replaceAll('_', ' '),
              child: PoiIcon(
                poiType: type,
              )))
          .toList();
    }
    return Wrap(
        direction: Axis.horizontal,
        spacing: YahaSpaceSizes.medium,
        runSpacing: YahaSpaceSizes.xSmall,
        alignment: WrapAlignment.start,
        children: children);
  }
}
