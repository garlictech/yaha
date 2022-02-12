import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/entities/hike/hike.dart';
import 'hike-repository-amplify.dart';

final bestHikesNearbyProvider = FutureProvider<List<Hike>>((ref) async {
  return ref.watch(hikeRepository).getHikeList();
});

final bestHikesOfTheWorldProvider = FutureProvider<List<Hike>>((ref) async {
  return ref.watch(hikeRepository).getHikeList();
});
