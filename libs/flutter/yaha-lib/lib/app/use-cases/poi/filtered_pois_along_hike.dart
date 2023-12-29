import 'package:flutter/foundation.dart';
import 'package:flutter_yaha_lib/app/utils/poi_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import '../../services/services.dart';
import 'end_points_of_hike.dart';
import 'pois_along_hike.dart';
import 'touristic_pois_along_hike_with_dynamic_pois.dart';

part "filtered_pois_along_hike.g.dart";

@riverpod
class FilteredPoisAlongHike extends _$FilteredPoisAlongHike {
  @override
  FutureOr<List<PoiOfHikeEntity>> build(String hikeId) async {
    final filteredPoiTypes = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.filteredPoiTypes));

    final showAllPoisAlongHike = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.showAllPoisAlongHike));

    final touristicPoisAlongHike = await ref
        .watch(touristicPoisAlongHikeWithDynamicPoisProvider(hikeId).future);

    if (filteredPoiTypes.isEmpty && !showAllPoisAlongHike) {
      return touristicPoisAlongHike;
    }

    final poisAlongHike = await ref.watch(poisAlongHikeProvider(hikeId).future);

    final endPoints = await ref.watch(endPointsOfHikeProvider(hikeId).future);

    final pois = showAllPoisAlongHike
        ? poisAlongHike
        : PoiUtils.filterPoisByTypes(poisAlongHike, filteredPoiTypes);

    final sortedPois = await PoiUtils.sortByDistanceFromHikeStart(pois);
    return [endPoints.value1, ...sortedPois, endPoints.value2];
  }
}
