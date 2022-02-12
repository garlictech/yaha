import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/entities/hike/hike.dart';
//import 'package:yaha/utility/buttons/show-more-button.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

import 'hike-card.dart';

class HorizontalHikeCards extends ConsumerWidget {
  final String title;
  final FutureProvider<List<Hike>> hikeListProvider;

  const HorizontalHikeCards(
      {required this.title, required this.hikeListProvider, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final hikes = watch(hikeListProvider);

    return Column(children: [
      Container(
        padding: const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
        alignment: Alignment.centerLeft,
        child: const Text(
          'Best hikes of the world',
          style: TextStyle(
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
                      .map((hike) => Container(
                          padding: const EdgeInsets.only(
                              right: YahaSpaceSizes.general),
                          width: YahaBoxSizes.widthMedium,
                          child: HikeCard(hike: hike)))
                      .toList()),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err')))
    ]);
//      ShowMoreButton(nextScreen: BestHikesOfTheWorld())
  }
}
