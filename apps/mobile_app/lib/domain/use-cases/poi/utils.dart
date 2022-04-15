import 'package:dartx/dartx.dart';

import '../../entities/entities.dart';

selectTouristicPois(List<Poi>? pois) {
  return pois
      ?.where((poi) => touristicCategories.contains(poi.poiType.category))
      .where((poi) => !nonTouristicKinds.contains(poi.poiType.kind))
      .distinctBy((poi) => poi.title)
      .toList();
}
