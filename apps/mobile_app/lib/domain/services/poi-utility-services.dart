import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/use-cases/hike/hike.dart';

import '../entities/entities.dart';

class PoiUtilityServices {
  final Ref ref;

  PoiUtilityServices({required this.ref});

  Future<List<PoiOfHike>> getOnroutePoisOfHike(
      Hike hike, HikingSettings hikingSettings) async {
    final pois = await ref.read(onroutePoisProvider(hike.id).future);
    return pois
        .whereType<Poi>()
        .where((poi) => poi.isSupported())
        .map((poi) =>
            PoiOfHike(poi: poi, hike: hike, ref: ref, settings: hikingSettings))
        .toList();
  }

  Future<List<Poi>> getOffroutePoisOfHike(Hike hike) async {
    final pois = await ref.read(offroutePoisProvider(hike.id).future);
    return pois.whereType<Poi>().where((poi) => poi.isSupported()).toList();
  }
}

final poiUtilityServicesProvider =
    Provider<PoiUtilityServices>((ref) => PoiUtilityServices(ref: ref));
