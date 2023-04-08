import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/services/poi-utility-services.dart';
import 'package:yaha/domain/domain.dart';

final poisAroundHikeProvider =
    FutureProvider.autoDispose.family<List<Poi>, String>((ref, hikeId) async {
  final poiUtilities = ref.read(poiUtilityServicesProvider);
  final hikeState = ref.watch(configuredHikeProvider(hikeId));
  final hikeSettings = ref.watch(hikingSettingsServiceProvider(hikeId));

  return hikeState.data == null
      ? Future.value([])
      : poiUtilities.getOffroutePoisOfHike(hikeState.data!, hikeSettings);
});
