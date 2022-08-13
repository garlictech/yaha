import 'package:dartx/dartx.dart';

import '../../entities/entities.dart';

class PoiUtils {
  static List<T> selectTouristicPois<T extends Poi>(List<T> pois) {
    return pois
        .where((poi) => touristicCategories.contains(poi.poiType.category))
        .where((poi) => !nonTouristicKinds.contains(poi.poiType.kind))
        .distinctBy((poi) => poi.title)
        .toList();
  }

  static List<PoiType> typeList(List<Poi> pois) {
    var poiList = pois.map<PoiType>((poi) => poi.poiType).toList();
    poiList.sort();
    return poiList;
  }

  static List<PoiType> uniqueTypes(List<Poi> pois) {
    return PoiUtils.typeList(pois).toSet().toList();
  }

  static List<PoiType> uniqueThings(List<Poi> pois) {
    return PoiUtils.uniqueTypes(pois)
        .where((poi) => poi.kind != 'unknown')
        .toList();
  }

  static List<T> filterPoisByTypes<T extends Poi>(
      List<T> pois, List<PoiType> poiTypes) {
    return pois.where((poi) => poiTypes.contains(poi.poiType)).toList();
  }
}
