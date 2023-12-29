import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_of_hike_entity.dart';

import 'touristic_pois_along_hike.dart';

part "random_touristic_pois_along_hike.g.dart";

@riverpod
class RandomTouristicPoisAlongHike extends _$RandomTouristicPoisAlongHike {
  @override
  FutureOr<List<PoiOfHikeEntity>> build(String hikeId) {
    final poisRandomTouristicPoisAlongHikeState =
        ref.watch(touristicPoisAlongHikeProvider(hikeId));

    if (poisRandomTouristicPoisAlongHikeState.isLoading) {
      return future;
    }

    final pois = poisRandomTouristicPoisAlongHikeState.asData?.value;

    if (pois == null) {
      return [];
    }

    final copiedPois = [...pois];
    copiedPois.shuffle();
    return copiedPois.take(10).toList();
  }
}
