import 'package:flutter_yaha_lib/app/utils/poi_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_entity.dart';

import 'pois_around_hike.dart';

part "touristic_pois_around_hike.g.dart";

@riverpod
class TouristicPoisAroundHike extends _$TouristicPoisAroundHike {
  @override
  FutureOr<List<PoiEntity>> build(String hikeId) async {
    final pois = await ref.watch(poisAroundHikeProvider(hikeId).future);

    return PoiUtils.selectTouristicPois(pois);
  }
}
