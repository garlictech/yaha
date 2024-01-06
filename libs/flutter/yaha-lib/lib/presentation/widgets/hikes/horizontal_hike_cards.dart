import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_yaha_lib/utility/buttons/show-more-button.dart';

import '../shared/shared.dart';
import 'hike_card.dart';

class HorizontalHikeCards extends ConsumerWidget {
  final String title;
  final AsyncValue<List<String>> trackIds;

  const HorizontalHikeCards(
      {required this.title, required this.trackIds, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      SectionTitle(title: title),
      trackIds.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (hits) => SizedBox(
              height: YahaBoxSizes.heightMedium,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: hits
                      .map((hikeId) => Container(
                          margin: const EdgeInsets.only(
                              right: YahaSpaceSizes.general),
                          width: YahaBoxSizes.widthMedium,
                          height: YahaBoxSizes.widthMedium,
                          child: HikeCard(hikeId: hikeId)))
                      .toList()))),
      //ShowMoreButton(nextScreen: BestHikesOfTheWorld())
    ]);
  }
}
