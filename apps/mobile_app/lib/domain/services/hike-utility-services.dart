import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/use-cases/hike/hike_provider.dart';

import '../entities/entities.dart';

class HikeUtilityServices {
  final ProviderReference ref;

  HikeUtilityServices({required this.ref});

  Future<List<Hike>> getHikes(List<String> hikeIds) {
    FutureGroup<Hike> group = FutureGroup<Hike>();

    for (var id in hikeIds) {
      final hike = ref.read(hikeProvider(id).future);
      group.add(hike);
    }

    group.close();
    return group.future;
  }
}

final hikeUtilityServicesProvider =
    Provider<HikeUtilityServices>((ref) => HikeUtilityServices(ref: ref));
