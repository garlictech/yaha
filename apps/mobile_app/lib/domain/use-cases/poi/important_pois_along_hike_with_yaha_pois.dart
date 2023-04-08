import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_of_hike.dart';
import 'package:yaha/domain/use-cases/poi/touristic_pois_along_hike_sorted_by_distance.dart';

import '../weather/weather_pois_of_hike.dart';
import 'end_points_of_hike.dart';
import 'utils.dart';

part "important_pois_along_hike_with_yaha_pois.g.dart";

@riverpod
class ImportantPoisAlongHikeWithYahaPois
    extends _$ImportantPoisAlongHikeWithYahaPois {
  @override
  List<PoiOfHike> build(String hikeId) {
    final poisAlongHike =
        ref.watch(touristicPoisAlongHikeSortedByDistanceProvider(hikeId));
    final endPoints = ref.watch(endPointsOfHikeProvider(hikeId));
    final weatherPois = ref.watch(weatherPoisOfHikeProvider(hikeId));

    if (endPoints == null) {
      state = [];
    } else {
      PoiUtils.sortByDistanceFromHikeStart(
              PoiUtils.selectTouristicPois<PoiOfHike>(poisAlongHike) +
                  weatherPois)
          .then((sortedPois) {
        state = [endPoints.value1, ...sortedPois, endPoints.value2];
      });
    }

    return [];
  }
}
