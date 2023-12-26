import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/providers.dart';

import '../../entities/poi/poi_entity.dart';

final offroutePoisProvider =
    FutureProvider.family<List<Poi>, String>((ref, hikeId) async {
  return ref.watch(hikeRepositoryProvider).getOffroutePois(hikeId);
});