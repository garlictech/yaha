import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/poi_utils.dart';
import '../weather/weather.dart';
import 'end_points_of_hike.dart';
import 'touristic_pois_along_hike.dart';

part "touristic_pois_along_hike_with_dynamic_pois.g.dart";

@riverpod
class TouristicPoisAlongHikeWithDynamicPois
    extends _$TouristicPoisAlongHikeWithDynamicPois {
  @override
  FutureOr<List<PoiOfHikeEntity>> build(String hikeId) async {
    final endPoints = await ref.watch(endPointsOfHikeProvider(hikeId).future);

    final pois = await ref.watch(touristicPoisAlongHikeProvider(hikeId).future);

    final weatherPois =
        await ref.read(weatherPoisOfHikeProvider(hikeId).future);

    final allPois = pois + weatherPois;

    final sortedPois = await PoiUtils.sortByDistanceFromHikeStart(allPois);

    return [endPoints.value1, ...sortedPois, endPoints.value2];
  }
}
