import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/hikes/hikes.dart';
import 'horizontal_hike_cards.dart';

class RandomHikesWorldwide extends ConsumerWidget {
  const RandomHikesWorldwide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hits = ref.watch(randomHikesWorldwideControllerProvider);

    return HorizontalHikeCards(
      title: 'Some hikes around the world',
      trackIds: hits,
    );
  }
}
