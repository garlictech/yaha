import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';

import '../shared/shared.dart';
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
