import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_entity.dart';
import 'package:flutter_yaha_lib/domain/utils/utils.dart';

import 'pois_around_hike.dart';
import 'utils.dart';

part "touristic_pois_around_hike.g.dart";

typedef TouristicPoisAroundHikeState = LoadableState<List<Poi>>;

@riverpod
class TouristicPoisAroundHike extends _$TouristicPoisAroundHike {
  @override
  TouristicPoisAroundHikeState build(String hikeId) {
    final poisState = ref.watch(poisAroundHikeProvider(hikeId));

    if (poisState.loading) {
      return TouristicPoisAroundHikeState(loading: true);
    }

    final pois = poisState.data;

    return TouristicPoisAroundHikeState(
        loading: false,
        data: pois == null ? [] : PoiUtils.selectTouristicPois(pois));
  }
}
