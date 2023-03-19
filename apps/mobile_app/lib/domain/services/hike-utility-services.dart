import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/use-cases/hike/cached_hike.dart';

import '../entities/entities.dart';

class HikeUtilityServices {
  final Ref ref;

  HikeUtilityServices({required this.ref});

  Future<List<Hike>> getHikes(List<String> hikeIds) {
    FutureGroup<Hike?> group = FutureGroup<Hike>();

    for (var id in hikeIds) {
      final hike = ref.read(cachedHikeProvider(id).future);
      group.add(hike);
    }

    group.close();
    return group.future.then((hikes) => hikes.whereType<Hike>().toList());
  }
}

final hikeUtilityServicesProvider =
    Provider<HikeUtilityServices>((ref) => HikeUtilityServices(ref: ref));
