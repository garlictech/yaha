import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_of_hike.dart';

import 'touristic_pois_along_hike.dart';

part "random_touristic_pois_along_hike.g.dart";

@riverpod
class RandomTouristicPoisAlongHike extends _$RandomTouristicPoisAlongHike {
  @override
  Future<List<PoiOfHike>> build(String hikeId) {
    return ref
        .watch(touristicPoisAlongHikeProvider(hikeId).future)
        .then((pois) {
      final copiedPois = [...pois];
      copiedPois.shuffle();
      return copiedPois.take(10).toList();
    });
  }
}
