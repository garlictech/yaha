import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';

class GuestHomeScreenViewModel {
  final FutureProvider<List<Hike>> bestHikesNearbyProvider;
  final FutureProvider<List<Hike>> bestHikesOfTheWorldProvider;

  GuestHomeScreenViewModel(
      {required this.bestHikesNearbyProvider,
      required this.bestHikesOfTheWorldProvider});
}
