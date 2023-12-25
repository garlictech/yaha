import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/domain/utils/utils.dart';

import 'pois_around_hike.dart';
import 'touristic_pois_around_hike.dart';

part "filtered_pois_around_hike.g.dart";

typedef FilteredPoisAroundHikeState = LoadableState<List<Poi>>;

@riverpod
class FilteredPoisAroundHike extends _$FilteredPoisAroundHike {
  @override
  FilteredPoisAroundHikeState build(String hikeId) {
    final showPoisAroundHike = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.showPoisAroundHike));

    if (!showPoisAroundHike) {
      return FilteredPoisAroundHikeState(loading: false, data: []);
    }

    final filteredPoiTypes = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.filteredPoiTypes));
    final importantPoisAroundHike =
        ref.watch(touristicPoisAroundHikeProvider(hikeId));

    if (filteredPoiTypes.isEmpty) {
      return importantPoisAroundHike;
    }

    final poisAroundHike = ref.watch(poisAroundHikeProvider(hikeId));

    if (poisAroundHike.loading) {
      return FilteredPoisAroundHikeState(loading: true);
    }

    final pois = poisAroundHike.data;
    return FilteredPoisAroundHikeState(
        loading: true,
        data: pois == null
            ? []
            : PoiUtils.filterPoisByTypes(pois, filteredPoiTypes));
  }
}
