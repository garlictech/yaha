import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_of_hike.dart';
import 'package:yaha/domain/utils/utils.dart';

import 'touristic_pois_along_hike.dart';

part "random_touristic_pois_along_hike.g.dart";

typedef RandomTouristicPoisAlongHikeState = LoadableState<List<PoiOfHike>>;

@riverpod
class RandomTouristicPoisAlongHike extends _$RandomTouristicPoisAlongHike {
  @override
  RandomTouristicPoisAlongHikeState build(String hikeId) {
    final poisRandomTouristicPoisAlongHikeState =
        ref.watch(touristicPoisAlongHikeProvider(hikeId));

    if (poisRandomTouristicPoisAlongHikeState.loading) {
      return RandomTouristicPoisAlongHikeState(loading: true);
    }

    final pois = poisRandomTouristicPoisAlongHikeState.data ?? [];
    final copiedPois = [...pois];
    copiedPois.shuffle();
    return RandomTouristicPoisAlongHikeState(
        loading: false, data: copiedPois.take(10).toList());
  }
}
