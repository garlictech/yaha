import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_of_hike.dart';
import 'package:flutter_yaha_lib/domain/use-cases/poi/touristic_pois_along_hike_sorted_by_distance.dart';
import 'package:flutter_yaha_lib/domain/utils/utils.dart';

import '../weather/weather_pois_of_hike.dart';
import 'end_points_of_hike.dart';
import 'utils.dart';

part "important_pois_along_hike_with_yaha_pois.g.dart";

typedef ImportantPoisAlongHikeWithYahaPoisState
    = LoadableState<List<PoiOfHike>>;

@riverpod
class ImportantPoisAlongHikeWithYahaPois
    extends _$ImportantPoisAlongHikeWithYahaPois {
  @override
  ImportantPoisAlongHikeWithYahaPoisState build(String hikeId) {
    final poisStateLoading = ref.watch(
        touristicPoisAlongHikeSortedByDistanceProvider(hikeId)
            .select((value) => value.loading));

    if (poisStateLoading) {
      return ImportantPoisAlongHikeWithYahaPoisState(loading: true);
    }

    final endPoints = ref.read(endPointsOfHikeProvider(hikeId));

    debugPrint("BUILT ImportantPoisAlongHikeWithYahaPois ${poisStateLoading}");

    final poisAlongHike = ref.watch(
        touristicPoisAlongHikeSortedByDistanceProvider(hikeId)
            .select((value) => value.data));

    if (poisAlongHike == null) {
      return ImportantPoisAlongHikeWithYahaPoisState(
          loading: false,
          data: endPoints == null ? [] : [endPoints.value1, endPoints.value2]);
    }

    final weatherPois = ref.read(weatherPoisOfHikeProvider(hikeId));

    PoiUtils.sortByDistanceFromHikeStart(
            PoiUtils.selectTouristicPois<PoiOfHike>(poisAlongHike) +
                weatherPois)
        .then((sortedPois) {
      state = ImportantPoisAlongHikeWithYahaPoisState(
          loading: false,
          data: endPoints == null
              ? sortedPois
              : [endPoints.value1, ...sortedPois, endPoints.value2]);
    });

    return ImportantPoisAlongHikeWithYahaPoisState(loading: true);
  }
}
