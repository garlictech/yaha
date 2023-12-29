import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/use-cases/search/search.dart';

import 'horizontal-hike-cards.dart';

class RandomHikesWorldwide extends ConsumerWidget {
  const RandomHikesWorldwide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResultState =
        ref.watch(searchBestHikesOfTheWorldUseCaseProvider);

    return HorizontalHikeCards(
      title: 'Some hikes around the world',
      trackIds: searchResultState,
    );
  }
}
