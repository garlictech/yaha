import 'package:yaha/models/Hike.dart';

class GuestHomeScreenViewModel {
  final List<Hike> bestHikesNearby;
  final List<Hike> bestHikesOfTheWorld;

  GuestHomeScreenViewModel(
      {required this.bestHikesNearby, required this.bestHikesOfTheWorld});
}
