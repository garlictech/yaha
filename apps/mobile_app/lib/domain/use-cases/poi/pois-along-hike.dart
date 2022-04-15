import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/use-cases/poi/utils.dart';
import '../../../providers/poi-providers.dart';
import '../../entities/entities.dart';

class PoisAlongHikeUsecases extends ChangeNotifier {
  List<Poi>? pois;
  List<PoiType>? _typeList;
  List<PoiType>? _uniquePois;
  List<Poi>? _touristicPois;

  final String hikeId;
  final ChangeNotifierProviderRef<PoisAlongHikeUsecases> ref;

  PoisAlongHikeUsecases({required this.hikeId, required this.ref}) {
    refreshPois();
  }

  void refreshPois() async {
    pois = null;
    _resetProps();
    notifyListeners();
    final poiUsecases = ref.read(poiUsecasesProvider);
    await for (final newPois in poiUsecases.getPoisAlongHike(hikeId)) {
      pois = newPois;
      _resetProps();
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

  List<Poi>? get touristicPois {
    return _touristicPois ??= selectTouristicPois(pois);
  }

  _resetProps() {
    _typeList = null;
    _uniquePois = null;
    _touristicPois = null;
  }
}
