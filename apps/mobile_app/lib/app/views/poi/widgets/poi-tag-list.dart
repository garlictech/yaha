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
                  backgroundColor: YahaColors.generic,
                  icon: Icons.park_rounded,
                  title: type,
                ))
            .toList()
        /*const [
        PoiFilters(
          backgroundColor: YahaColors.generic,
          icon: Icons.location_city_rounded,
          title: "Generic",
        ),
        PoiFilters(
          backgroundColor: YahaColors.amenity,
          icon: Icons.fastfood_rounded,
          title: "Amenity",
        ),
        PoiFilters(
          backgroundColor: YahaColors.natural,
          icon: Icons.park_rounded,
          title: "Natural",
        ),
        PoiFilters(
          backgroundColor: YahaColors.emergency,
          icon: Icons.local_hospital_rounded,
          title: "Emergency",
        ),
        PoiFilters(
          backgroundColor: YahaColors.publicTransport,
          icon: Icons.commute_rounded,
          title: "Public Transport",
        ),
      ],*/
        );
  }
}
