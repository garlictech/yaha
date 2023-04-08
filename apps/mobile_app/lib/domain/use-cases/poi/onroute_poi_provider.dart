
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';

import '../../entities/poi/poi_entity.dart';

final onroutePoisProvider =
    FutureProvider.family<List<Poi>, String>((ref, hikeId) async {
  return ref.watch(hikeRepositoryProvider).getOnroutePois(hikeId);
});
