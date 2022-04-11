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

  Set<String> get typeList {
    return pois
        .map((poi) => poi.types)
        .toList()
        .whereType<List<String>>()
        .expand((i) => i)
        .toSet();
  }
}
