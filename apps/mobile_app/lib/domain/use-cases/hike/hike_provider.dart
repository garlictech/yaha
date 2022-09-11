import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';

import '../../entities/hike/hike.dart';

final hikeProvider = FutureProvider.family<Hike, String>((ref, hikeId) async {
  return ref.read(hikeRepositoryProvider).getHike(hikeId);
});
