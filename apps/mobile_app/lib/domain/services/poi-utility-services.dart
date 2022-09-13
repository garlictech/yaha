import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../entities/entities.dart';
import '../use-cases/poi/poi_provider.dart';

class PoiUtilityServices {
  final ProviderReference ref;

  PoiUtilityServices({required this.ref});

  Future<List<PoiOfHike>> getPoisOfHike(
      Hike hike, HikingSettings hikingSettings) async {
    final pois = await ConcatStream(hike.route.onroutePois.map(
            (poiId) => Stream.fromFuture(ref.read(poiProvider(poiId).future))))
        .doOnData((x) => debugPrint(x.toString()))
        .toSet();

    return pois
        .whereType<Poi>()
        .map((poi) =>
            PoiOfHike(poi: poi, hike: hike, ref: ref, settings: hikingSettings))
        .toList();
  }
}

final poiUtilityServicesProvider =
    Provider<PoiUtilityServices>((ref) => PoiUtilityServices(ref: ref));
