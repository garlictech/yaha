import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_of_hike.dart';
import 'package:yaha/domain/use-cases/poi/touristic_pois_along_hike_sorted_by_distance.dart';

import '../weather/weather_usecases.dart';
import 'end_points_of_hike.dart';
import 'utils.dart';

part "important_pois_along_hike_with_yaha_pois.g.dart";

@riverpod
class ImportantPoisAlongHikeWithYahaPoisProvider
    extends _$ImportantPoisAlongHikeWithYahaPoisProvider {
  @override
  Future<List<PoiOfHike>> build(String hikeId) async {
    final poisAlongHike = await ref
        .watch(touristicPoisAlongHikeSortedByDistanceProvider(hikeId).future);
    final endPoints = await ref.watch(endPointsOfHikeProvider(hikeId).future);

    if (endPoints == null) {
      return [];
    }

    final weatherPois =
        await ref.watch(weatherPoisOfHikeProvider(hikeId).future);

    final sortedPois = await PoiUtils.sortByDistanceFromHikeStart(
        PoiUtils.selectTouristicPois<PoiOfHike>(poisAlongHike) + weatherPois);

    return [endPoints.value1, ...sortedPois, endPoints.value2];
  }
}
