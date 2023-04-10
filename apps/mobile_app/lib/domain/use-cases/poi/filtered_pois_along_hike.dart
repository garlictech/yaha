import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/domain.dart';

part "filtered_pois_along_hike.g.dart";

@riverpod
class FilteredPoisAlongHike extends _$FilteredPoisAlongHike {
  @override
  List<PoiOfHike> build(String hikeId) {
    final filteredPoiTypes = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.filteredPoiTypes));
    final showAllPoisAlongHike = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.showAllPoisAlongHike));
    final poisAlongHike = ref.watch(poisAlongHikeProvider(hikeId));
    final importantPoisAlongHike =
        ref.watch(importantPoisAlongHikeWithYahaPoisProvider(hikeId));
    final endPoints = ref.watch(endPointsOfHikeProvider(hikeId));

    if (endPoints == null) {
      return [];
    }

    if (filteredPoiTypes.isEmpty && !showAllPoisAlongHike) {
      return importantPoisAlongHike;
    }

    final pois = showAllPoisAlongHike
        ? poisAlongHike
        : PoiUtils.filterPoisByTypes(poisAlongHike, filteredPoiTypes);

    PoiUtils.sortByDistanceFromHikeStart(pois).then((sortedPois) {
      state = [endPoints.value1, ...sortedPois, endPoints.value2];
    });

    return [];
  }
}
