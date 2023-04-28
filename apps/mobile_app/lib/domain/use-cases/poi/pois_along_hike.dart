import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_of_hike.dart';
import 'package:yaha/domain/services/poi-utility-services.dart';
import 'package:yaha/domain/use-cases/hike/configured_hike.dart';
import 'package:yaha/domain/use-cases/hike/hiking_settings_service.dart';
import 'package:yaha/domain/utils/utils.dart';

part "pois_along_hike.g.dart";

typedef PoisAlongHikeState = LoadableState<List<PoiOfHike>>;

@riverpod
class PoisAlongHike extends _$PoisAlongHike {
  @override
  PoisAlongHikeState build(String hikeId) {
    final poiUtilities = ref.read(poiUtilityServicesProvider);
    final hikeSettings = ref.watch(hikingSettingsServiceProvider(hikeId));
    final hikeState = ref.watch(configuredHikeProvider(hikeId));

    if (hikeState.loading) {
      return PoisAlongHikeState(loading: true);
    }

    if (hikeState.data == null) {
      return PoisAlongHikeState(loading: false, data: []);
    }

    final hike = hikeState.data!;

    poiUtilities
        .getOnroutePoisOfHike(hike, hikeSettings)
        .then((pois) => state = PoisAlongHikeState(loading: false, data: pois));

    return PoisAlongHikeState(loading: true);
  }
}
