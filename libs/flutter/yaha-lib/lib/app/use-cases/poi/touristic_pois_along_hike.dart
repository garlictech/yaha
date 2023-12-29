import 'package:flutter_yaha_lib/app/utils/poi_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_of_hike_entity.dart';

import 'pois_along_hike.dart';

part "touristic_pois_along_hike.g.dart";

@riverpod
class TouristicPoisAlongHike extends _$TouristicPoisAlongHike {
  @override
  FutureOr<List<PoiOfHikeEntity>> build(String hikeId) async {
    final pois = await ref.watch(poisAlongHikeProvider(hikeId).future);

    return PoiUtils.selectTouristicPois(pois);
  }
}
