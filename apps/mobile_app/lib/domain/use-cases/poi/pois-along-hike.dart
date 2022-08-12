import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/app/providers.dart';

class PoisAlongHikeUsecases extends ChangeNotifier {
  List<PoiOfHike>? pois;
  List<PoiType>? _typeList;
  List<PoiType>? _uniquePois;
  late final Future<Hike?> _associatedHike;
  final String hikeId;
  final ChangeNotifierProviderRef<PoisAlongHikeUsecases> ref;
  late final PoiUsecases poiUsecases;
  late final HikeRepository hikeRepository;

  PoisAlongHikeUsecases({required this.hikeId, required this.ref}) {
    hikeRepository = ref.read(hikeRepositoryProvider);
    poiUsecases = ref.read(poiUsecasesProvider);
    _associatedHike = hikeRepository.getHike(hikeId);
    refreshPois();
  }

  void refreshPois() async {
    pois = null;
    _resetProps();
    notifyListeners();
    final hike = await _associatedHike;

    if (hike != null) {
      pois = List<PoiOfHike>.from(
          await Stream.castFrom(poiUsecases.getPoisAlongHike(hikeId))
              .map((newPois) => newPois
                  .map((poi) => PoiOfHike(poi: poi, hike: hike, ref: ref))
                  .toList())
              .last);
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

  _resetProps() {
    _typeList = null;
    _uniquePois = null;
  }
}
