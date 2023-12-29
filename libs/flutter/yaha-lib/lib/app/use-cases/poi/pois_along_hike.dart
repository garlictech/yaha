import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/services.dart';
import '../hike/hike.dart';
import 'onroute_poi_provider.dart';

part "pois_along_hike.g.dart";

@riverpod
class PoisAlongHike extends _$PoisAlongHike {
  @override
  FutureOr<List<PoiOfHikeEntity>> build(String hikeId) async {
    final hikingSettings = ref.watch(hikingSettingsServiceProvider(hikeId));

    final hike = await ref.watch(createConfiguredHikeProvider(hikeId).future);

    final pois = await ref.watch(onroutePoisProvider(hikeId).future);

    return pois
        .whereType<PoiEntity>()
        .where((poi) => poi.isSupported())
        .map((poi) => PoiOfHikeEntity(
            poi: poi, hike: hike, ref: ref, settings: hikingSettings))
        .toList();
  }
}
