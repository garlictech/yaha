import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuestHomeScreenViewModel {
  final FutureProvider<List<String>> bestHikesNearbyProvider;
  final FutureProvider<List<String>> bestHikesOfTheWorldProvider;

  GuestHomeScreenViewModel(
      {required this.bestHikesNearbyProvider,
      required this.bestHikesOfTheWorldProvider});
}
