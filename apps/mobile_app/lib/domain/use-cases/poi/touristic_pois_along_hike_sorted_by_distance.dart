import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_of_hike.dart';

import 'touristic_pois_along_hike.dart';
import 'utils.dart';

part "touristic_pois_along_hike_sorted_by_distance.g.dart";

@riverpod
class TouristicPoisAlongHikeSortedByDistance
    extends _$TouristicPoisAlongHikeSortedByDistance {
  @override
  Future<List<PoiOfHike>> build(String hikeId) {
    return ref
        .watch(touristicPoisAlongHikeProvider(hikeId).future)
        .then((pois) => PoiUtils.sortByDistanceFromHikeStart(pois));
  }
}
