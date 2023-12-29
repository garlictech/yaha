import 'package:flutter_yaha_lib/app/utils/poi_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import '../../services/services.dart';
import 'pois_around_hike.dart';
import 'touristic_pois_around_hike.dart';

part "filtered_pois_around_hike.g.dart";

@riverpod
class FilteredPoisAroundHike extends _$FilteredPoisAroundHike {
  @override
  FutureOr<List<PoiEntity>> build(String hikeId) async {
    final showPoisAroundHike = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.showPoisAroundHike));

    final filteredPoiTypes = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.filteredPoiTypes));

    final importantPoisAroundHike =
        await ref.watch(touristicPoisAroundHikeProvider(hikeId).future);

    if (filteredPoiTypes.isEmpty && !showPoisAroundHike) {
      return importantPoisAroundHike;
    }

    final poisAroundHike =
        await ref.watch(poisAroundHikeProvider(hikeId).future);

    return showPoisAroundHike
        ? poisAroundHike
        : PoiUtils.filterPoisByTypes(poisAroundHike, filteredPoiTypes);
  }
}
