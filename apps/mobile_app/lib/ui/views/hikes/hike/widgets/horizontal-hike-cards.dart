import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:yaha/utility/buttons/show-more-button.dart';

import '../../../shared/shared.dart';
import '../../../utils/error-utils.dart';
import 'hike-card.dart';

class HorizontalHikeCards extends ConsumerWidget {
  final String title;
  final FutureProvider<List<String>> hikeListProvider;

  const HorizontalHikeCards(
      {required this.title, required this.hikeListProvider, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hikes = ref.watch(hikeListProvider);

    return Column(children: [
      Container(
        padding: const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: YahaFontSizes.medium,
              fontWeight: FontWeight.w600,
              color: YahaColors.textColor),
        ),
      ),
      SizedBox(
          height: YahaBoxSizes.heightMedium,
          child: hikes.when(
              data: (data) => ListView(
                  scrollDirection: Axis.horizontal,
                  children: data
                      .map((hikeId) => Container(
                          padding: const EdgeInsets.only(
                              right: YahaSpaceSizes.general),
                          width: YahaBoxSizes.widthMedium,
                          child: HikeCard(hikeId: hikeId)))
                      .toList()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: errorWidget))
      //ShowMoreButton(nextScreen: BestHikesOfTheWorld())
    ]);
  }
}
