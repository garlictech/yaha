import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_of_hike.dart';
import 'package:flutter_yaha_lib/domain/utils/utils.dart';

import 'touristic_pois_along_hike.dart';
import 'utils.dart';

part "touristic_pois_along_hike_sorted_by_distance.g.dart";

typedef TouristicPoisAlongHikeSortedByDistanceState
    = LoadableState<List<PoiOfHike>>;

@riverpod
class TouristicPoisAlongHikeSortedByDistance
    extends _$TouristicPoisAlongHikeSortedByDistance {
  @override
  TouristicPoisAlongHikeSortedByDistanceState build(String hikeId) {
    final poisState = ref.watch(touristicPoisAlongHikeProvider(hikeId));

    if (poisState.loading) {
      return TouristicPoisAlongHikeSortedByDistanceState(loading: true);
    }

    if (poisState.data == null) {
      return TouristicPoisAlongHikeSortedByDistanceState(
          loading: false, data: []);
    }

    final pois = poisState.data!;

    PoiUtils.sortByDistanceFromHikeStart(pois).then((pois) => state =
        TouristicPoisAlongHikeSortedByDistanceState(
            loading: false, data: pois));

    return TouristicPoisAlongHikeSortedByDistanceState(loading: true);
  }
}
