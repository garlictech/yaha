import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';

import '../hike/widgets/horizontal-hike-cards.dart';

class RandomHikesWorldwide extends ConsumerWidget {
  const RandomHikesWorldwide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hikes = ref.watch(bestHikesNearbyProvider);

    return HorizontalHikeCards(
        title: 'Some hikes around the world',
        hikeListProvider: bestHikesOfTheWorldProvider);
  }
}
