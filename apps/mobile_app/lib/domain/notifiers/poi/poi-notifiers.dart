import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/poi-providers.dart';
import '../../entities/entities.dart';

class PoisAlongHikeNotifier extends ChangeNotifier {
  List<Poi> pois = [];

  final String hikeId;
  final ChangeNotifierProviderRef<PoisAlongHikeNotifier> ref;

  PoisAlongHikeNotifier({required this.hikeId, required this.ref}) {
    refreshPois();
  }

  void refreshPois() async {
    final poiUsecases = ref.read(poiUsecasesProvider);
    pois = await poiUsecases.getPoisAlongHike(hikeId);
    notifyListeners();
  }

  List<PoiType> get typeList {
    List<PoiType> poiList = pois
        .map((poi) => poi.poiTypes)
        .toList()
        .whereType<Set<PoiType>>()
        .expand((i) => i)
        .toSet()
        .toList();

    poiList.sort();
    return poiList;
  }
}
