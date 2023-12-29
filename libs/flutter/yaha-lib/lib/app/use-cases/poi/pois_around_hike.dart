import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'offroute_poi_provider.dart';

part "pois_around_hike.g.dart";

@riverpod
class PoisAroundHike extends _$PoisAroundHike {
  @override
  FutureOr<List<PoiEntity>> build(String hikeId) async {
    final offroutePois = await ref.watch(offroutePoisProvider(hikeId).future);

    return offroutePois
        .whereType<PoiEntity>()
        .where((poi) => poi.isSupported())
        .toList();
  }
}
