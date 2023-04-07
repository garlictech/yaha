import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_of_hike.dart';

import 'pois_along_hike.dart';
import 'utils.dart';

part "touristic_pois_along_hike.g.dart";

@riverpod
class TouristicPoisAlongHike extends _$TouristicPoisAlongHike {
  @override
  Future<List<PoiOfHike>> build(String hikeId) {
    return ref
        .watch(poisAlongHikeProvider(hikeId).future)
        .then((pois) => PoiUtils.selectTouristicPois(pois));
  }
}
