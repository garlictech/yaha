import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/poi-providers.dart';
import '../../entities/entities.dart';

class PoisAlongHikeNotifier extends ChangeNotifier {
  List<Poi> pois = [];
  List<PoiType>? _typeList;
  List<PoiType>? _uniquePois;

  final String hikeId;
  final ChangeNotifierProviderRef<PoisAlongHikeNotifier> ref;

  PoisAlongHikeNotifier({required this.hikeId, required this.ref}) {
    refreshPois();
  }

  void refreshPois() async {
    final poiUsecases = ref.read(poiUsecasesProvider);
    pois = await poiUsecases.getPoisAlongHike(hikeId);
    _typeList = null;
    _uniquePois = null;
    notifyListeners();
  }

  List<PoiType> get typeList {
    getTypeList() {
      var poiList = pois.map<PoiType>((poi) => poi.poiType).toList();
      poiList.sort();
      debugPrint("Lofasz - 1: ${poiList.length}");
      return poiList;
    }

    return _typeList ??= getTypeList();
  }

  List<PoiType> get uniqueTypes {
    debugPrint("Lofasz: ${pois.length}");
    debugPrint("Lofasz: ${typeList.length}");
    getTypeList() => typeList.toSet().toList();
    debugPrint("Lofasz2: ${typeList.length}");
    debugPrint("Lofasz3: ${typeList.toSet().length}");

    return _uniquePois ??= getTypeList();
  }
}
