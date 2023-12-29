import 'package:flutter_yaha_lib/app/utils/poi_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_of_hike_entity.dart';

import 'touristic_pois_along_hike.dart';

part "touristic_pois_along_hike_sorted_by_distance.g.dart";

@riverpod
class TouristicPoisAlongHikeSortedByDistance
    extends _$TouristicPoisAlongHikeSortedByDistance {
  @override
  FutureOr<List<PoiOfHikeEntity>> build(String hikeId) async {
    final pois = await ref.watch(touristicPoisAlongHikeProvider(hikeId).future);

    return PoiUtils.sortByDistanceFromHikeStart(pois);
  }
}
