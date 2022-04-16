import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/domain/use-cases/poi/utils.dart';
import 'package:yaha/providers/providers.dart';
import 'package:yaha/utils/geometry/geocalc_js.dart';
import 'package:rxdart/rxdart.dart';

class PoisAlongHikeUsecases extends ChangeNotifier {
  List<PoiOfHike>? pois;
  List<PoiType>? _typeList;
  List<PoiType>? _uniquePois;
  List<PoiOfHike>? _touristicPois;
  Stream<List<PoiOfHike>>? _touristicPoisByDistance;
  late final Future<Hike> _associatedHike;
  final String hikeId;
  final ChangeNotifierProviderRef<PoisAlongHikeUsecases> ref;
  late final PoiUsecases poiUsecases;
  late final HikeRepository hikeRepository;
  late final GeocalcService geocalc;

  PoisAlongHikeUsecases({required this.hikeId, required this.ref}) {
    hikeRepository = ref.read(hikeRepositoryProvider);
    poiUsecases = ref.read(poiUsecasesProvider);
    geocalc = ref.watch(geoCalcProvider);
    _associatedHike = hikeRepository.getHike(hikeId);
    refreshPois();
  }

  void refreshPois() async {
    pois = null;
    notifyListeners();
    final hike = await _associatedHike;
    Stream.castFrom(poiUsecases.getPoisAlongHike(hikeId))
        .throttleTime(const Duration(seconds: 1))
        .map((newPois) => newPois
            .map((poi) =>
                PoiOfHike(poi: poi, hike: hike, geocalcService: geocalc))
            .toList())
        .doOnData((newPois) {
      pois = List<PoiOfHike>.from(newPois);
      _resetProps();
      notifyListeners();
    }).listen(null);
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

  List<PoiOfHike>? get touristicPois {
    return _touristicPois ??= selectTouristicPois(pois);
  }

  Stream<List<PoiOfHike>> get touristicPoisSortedByDistance {
    return _touristicPoisByDistance ??= ForkJoinStream.list(
            touristicPois!.map((poi) => poi.distanceFromStart).toList())
        .map((_) {
      touristicPois?.sort((a, b) => (a.distanceFromStartSync ?? 0)
          .compareTo((b.distanceFromStartSync ?? 0)));
      return touristicPois ?? [];
    }).shareReplay();
  }

  _resetProps() {
    _typeList = null;
    _uniquePois = null;
    _touristicPois = null;
    _touristicPoisByDistance = null;
  }
}
