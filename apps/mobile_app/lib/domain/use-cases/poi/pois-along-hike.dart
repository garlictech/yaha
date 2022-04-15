import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/poi-providers.dart';
import '../../entities/entities.dart';

class PoisAlongHikeUsecases extends ChangeNotifier {
  List<Poi>? pois;
  List<PoiType>? _typeList;
  List<PoiType>? _uniquePois;

  final String hikeId;
  final ChangeNotifierProviderRef<PoisAlongHikeUsecases> ref;

  PoisAlongHikeUsecases({required this.hikeId, required this.ref}) {
    refreshPois();
  }

  void refreshPois() async {
    _typeList = null;
    _uniquePois = null;
    notifyListeners();
    final poiUsecases = ref.read(poiUsecasesProvider);
    await for (final newPois in poiUsecases.getPoisAlongHike(hikeId)) {
      pois = newPois;
      _typeList = null;
      _uniquePois = null;
      notifyListeners();
    }
  }

  List<PoiType>? get typeList {
    getTypeList() {
      var poiList = pois?.map<PoiType>((poi) => poi.poiType).toList();
      poiList?.sort();
      return poiList;
    }

    return _typeList ??= getTypeList();
  }

  List<PoiType>? get uniqueTypes {
    getTypeList() => typeList?.toSet().toList();
    return _uniquePois ??= getTypeList();
  }
}
