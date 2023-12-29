import 'package:dartx/dartx.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

class PoiUtils {
  static List<T> selectTouristicPois<T extends PoiEntity>(List<T> pois) {
    return pois
        .where((poi) => touristicCategories.contains(poi.poiType.category))
        .where((poi) => !nonTouristicKinds.contains(poi.poiType.kind))
        .distinctBy((poi) => poi.title)
        .toList();
  }

  static List<PoiType> typeList(List<PoiEntity> pois) {
    var poiList = pois.map<PoiType>((poi) => poi.poiType).toList();
    poiList.sort();
    return poiList;
  }

  static List<PoiType> uniqueTypes(List<PoiEntity> pois) {
    return PoiUtils.typeList(pois).toSet().toList();
  }

  static List<PoiType> uniqueThings(List<PoiEntity> pois) {
    return PoiUtils.uniqueTypes(pois)
        .where((poi) => poi.kind != 'unknown')
        .toList();
  }

  static List<T> filterPoisByTypes<T extends PoiEntity>(
      List<T> pois, List<PoiType> poiTypes) {
    return pois.where((poi) {
      return poiTypes.contains(poi.poiType);
    }).toList();
  }

  static Future<List<PoiOfHikeEntity>> sortByDistanceFromHikeStart(
      List<PoiOfHikeEntity> pois) async {
    List<Tuple2<double, PoiOfHikeEntity>> forSorting = [];

    for (var poi in pois) {
      final val = await poi.distanceFromStart;
      forSorting.add(Tuple2(val, poi));
    }

    forSorting.sort((a, b) {
      return a.value1.compareTo(b.value1);
    });

    return forSorting.map((t) => t.value2).toList();
  }
}
