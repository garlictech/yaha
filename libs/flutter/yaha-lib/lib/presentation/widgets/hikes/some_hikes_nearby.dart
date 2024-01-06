import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/presentation/controllers/hikes/some_hikes_nearby_controller.dart';

import 'horizontal_hike_cards.dart';

class SomeHikesNearby extends ConsumerWidget {
  const SomeHikesNearby({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hits = ref.watch(someHikesNearbyControllerProvider);

    return HorizontalHikeCards(
      title: 'Some hikes near you',
      trackIds: hits,
    );
  }
}
