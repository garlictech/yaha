import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hike-repository-amplify.dart';
import 'package:yaha/models/ModelProvider.dart';

final bestHikesNearbyProvider = FutureProvider<List<Hike>>((ref) async {
  return ref.watch(hikeRepository).getHikeList();
});

final bestHikesOfTheWorldProvider = FutureProvider<List<Hike>>((ref) async {
  return ref.watch(hikeRepository).getHikeList();
});
