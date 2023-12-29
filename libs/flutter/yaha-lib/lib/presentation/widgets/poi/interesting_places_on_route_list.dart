import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';
import 'package:flutter_yaha_lib/domain/use-cases/poi/random_touristic_pois_along_hike.dart';
import 'package:flutter_yaha_lib/ui/views/shared/widgets/progress_indicator.dart';
import 'package:flutter_yaha_lib/ui/views/shared/widgets/yaha-border-radius.dart';
import 'package:flutter_yaha_lib/ui/views/shared/widgets/yaha-colors.dart';
import 'package:flutter_yaha_lib/ui/views/shared/widgets/yaha-space-sizes.dart';

import 'poi-title-list.dart';

class InterestingPlacesOnRouteList extends ConsumerWidget {
  final HikeEntity hike;

  const InterestingPlacesOnRouteList({super.key, required this.hike});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poisState = ref.watch(randomTouristicPoisAlongHikeProvider(hike.id));

    final pois = poisState.asData?.value ?? [];

    return poisState.isLoading
        ? const YahaProgressIndicator(text: "Loading interesting places...")
        : Container(
            padding: const EdgeInsets.all(YahaSpaceSizes.general),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: YahaColors.accentColor,
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
            ),
            child: PoiTitleList(pois: pois));
  }
}
