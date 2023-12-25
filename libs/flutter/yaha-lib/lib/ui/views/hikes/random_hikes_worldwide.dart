import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/providers.dart';

import 'horizontal-hike-cards.dart';

class RandomHikesWorldwide extends ConsumerWidget {
  const RandomHikesWorldwide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HorizontalHikeCards(
        title: 'Some hikes around the world',
        hikeListProvider: bestHikesOfTheWorldProvider);
  }
}
