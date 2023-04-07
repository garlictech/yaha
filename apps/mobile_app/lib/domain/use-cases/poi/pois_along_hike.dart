import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_of_hike.dart';
import 'package:yaha/domain/services/poi-utility-services.dart';
import 'package:yaha/domain/use-cases/hike/cached_hike.dart';
import 'package:yaha/domain/use-cases/hike/hiking_settings_service.dart';

part "pois_along_hike.g.dart";

@riverpod
class PoisAlongHike extends _$PoisAlongHike {
  @override
  Future<List<PoiOfHike>> build(String hikeId) {
    final poiUtilities = ref.read(poiUtilityServicesProvider);
    final hikeSettings = ref.watch(hikingSettingsServiceProvider(hikeId));

    return ref
        .watch(cachedHikeProvider(hikeId).future)
        .then((hike) => poiUtilities.getOnroutePoisOfHike(hike, hikeSettings));
  }
}
