import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/domain/utils/utils.dart';

part "filtered_pois_along_hike.g.dart";

typedef FilteredPoisAlongHikeState = LoadableState<List<PoiOfHike>>;

@riverpod
class FilteredPoisAlongHike extends _$FilteredPoisAlongHike {
  @override
  FilteredPoisAlongHikeState build(String hikeId) {
    final filteredPoiTypes = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.filteredPoiTypes));
    final showAllPoisAlongHike = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.showAllPoisAlongHike));
    final importantPoisAlongHike =
        ref.watch(importantPoisAlongHikeWithYahaPoisProvider(hikeId));

    debugPrint(
        "BUILT FilteredPoisAlongHike ${importantPoisAlongHike.loading} - ${importantPoisAlongHike.data?.length}");

    if (filteredPoiTypes.isEmpty && !showAllPoisAlongHike) {
      return FilteredPoisAlongHikeState(
          loading: false, data: importantPoisAlongHike.data);
    }

    final poisAlongHikeState = ref.watch(poisAlongHikeProvider(hikeId));

    if (poisAlongHikeState.loading) {
      return FilteredPoisAlongHikeState(loading: true);
    }

    final endPoints = ref.watch(endPointsOfHikeProvider(hikeId));

    if (poisAlongHikeState.data == null) {
      return FilteredPoisAlongHikeState(
          loading: false,
          data: endPoints == null ? [] : [endPoints.value1, endPoints.value2]);
    }

    final poisAlongHike = poisAlongHikeState.data!;

    final pois = showAllPoisAlongHike
        ? poisAlongHike
        : PoiUtils.filterPoisByTypes(poisAlongHike, filteredPoiTypes);

    PoiUtils.sortByDistanceFromHikeStart(pois).then((sortedPois) {
      state = FilteredPoisAlongHikeState(
          loading: false,
          data: endPoints == null
              ? sortedPois
              : [endPoints.value1, ...sortedPois, endPoints.value2]);
    });

    return FilteredPoisAlongHikeState(loading: true);
  }
}
