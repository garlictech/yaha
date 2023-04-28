import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/entities/poi/poi_entity.dart';
import 'package:yaha/domain/services/poi-utility-services.dart';
import 'package:yaha/domain/use-cases/hike/configured_hike.dart';
import 'package:yaha/domain/utils/utils.dart';

part "pois_around_hike.g.dart";

typedef PoisAroundHikeState = LoadableState<List<Poi>>;

@riverpod
class PoisAroundHike extends _$PoisAroundHike {
  @override
  PoisAroundHikeState build(String hikeId) {
    final poiUtilities = ref.read(poiUtilityServicesProvider);
    final hikeState = ref.watch(configuredHikeProvider(hikeId));

    if (hikeState.loading) {
      return PoisAroundHikeState(loading: true);
    }

    if (hikeState.data == null) {
      return PoisAroundHikeState(loading: false, data: []);
    }

    final hike = hikeState.data!;

    poiUtilities.getOffroutePoisOfHike(hike).then(
        (pois) => state = PoisAroundHikeState(loading: false, data: pois));

    return PoisAroundHikeState(loading: true);
  }
}
