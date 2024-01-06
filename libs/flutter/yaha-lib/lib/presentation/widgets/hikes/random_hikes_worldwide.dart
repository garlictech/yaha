import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/use-cases/search/search.dart';

import 'horizontal-hike-cards.dart';

class RandomHikesWorldwide extends ConsumerWidget {
  const RandomHikesWorldwide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCase =
        ref.watch(searchBestHikesOfTheWorldUseCaseProvider.notifier);

    final searchResultState = useCase.execute();

    return FutureBuilder(
      future: searchResultState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HorizontalHikeCards(
            title: 'Some hikes around the world',
            trackIds: snapshot.data ?? [],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
