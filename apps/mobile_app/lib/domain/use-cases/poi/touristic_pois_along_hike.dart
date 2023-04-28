import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_of_hike.dart';
import 'package:yaha/domain/utils/utils.dart';

import 'pois_along_hike.dart';
import 'utils.dart';

part "touristic_pois_along_hike.g.dart";

typedef TouristicPoisAlongHikeState = LoadableState<List<PoiOfHike>>;

@riverpod
class TouristicPoisAlongHike extends _$TouristicPoisAlongHike {
  @override
  TouristicPoisAlongHikeState build(String hikeId) {
    final poisState = ref.watch(poisAlongHikeProvider(hikeId));

    if (poisState.loading) {
      return TouristicPoisAlongHikeState(loading: true);
    }

    return TouristicPoisAlongHikeState(
        loading: false,
        data: PoiUtils.selectTouristicPois(poisState.data ?? []));
  }
}
