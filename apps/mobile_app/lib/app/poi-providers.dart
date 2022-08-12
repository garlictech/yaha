import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/data.dart';
import 'package:yaha/domain/domain.dart';

import '../domain/use-cases/poi/utils.dart';

final poiRepositoryProvider = Provider<PoiRepository>(
  (ref) => PoiRepositoryAmplify(),
);

final poiUsecasesProvider = Provider<PoiUsecases>(
  (ref) => PoiUsecasesImpl(ref: ref),
);

final poisAlongHikeUsecasesProvider =
    ChangeNotifierProvider.family<PoisAlongHikeUsecases, String>((ref, hikeId) {
  return PoisAlongHikeUsecases(hikeId: hikeId, ref: ref);
});

final touristicPoisAlongHikeProvider =
    Provider.family<List<PoiOfHike>?, String>((ref, hikeId) {
  final poisAlongHike =
      ref.watch(poisAlongHikeUsecasesProvider(hikeId).select((p) => p.pois));
  return poisAlongHike != null
      ? selectTouristicPois<PoiOfHike>(poisAlongHike)
      : null;
});

final touristicPoisAlongHikeSortedByDistanceProvider =
    FutureProvider.family<List<PoiOfHike>?, String>((ref, hikeId) async {
  final poisAlongHike = ref.watch(touristicPoisAlongHikeProvider(hikeId));
  List<Tuple2<double, PoiOfHike>> forSorting = [];

  if (poisAlongHike != null) {
    for (var poi in poisAlongHike) {
      final val = await poi.distanceFromStart;
      forSorting.add(Tuple2(val, poi));
    }

    forSorting.sort((a, b) {
      return a.value1.compareTo(b.value1);
    });

    return forSorting.map((t) => t.value2).toList();
  } else {
    return null;
  }
});
