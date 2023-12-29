import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/use-cases/search/search.dart';

import 'horizontal-hike-cards.dart';

class SomeHikesNearby extends ConsumerWidget {
  const SomeHikesNearby({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResultState =
        ref.watch(searchTracksAroundCurrentLocationUseCaseProvider);

    return HorizontalHikeCards(
      title: 'Some hikes near you',
      trackIds: searchResultState,
    );
  }
}
