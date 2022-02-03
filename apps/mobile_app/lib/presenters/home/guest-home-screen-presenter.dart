import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/models/ModelProvider.dart';
import 'package:yaha/viewmodels/hikes/guest-home-screen-viewmodel.dart';
import 'package:yaha/repositories/hikes/hikes.dart';

class GuestHomeScreenPresenter extends StateNotifier<GuestHomeScreenViewModel> {
  final ProviderReference ref;

  GuestHomeScreenPresenter(
      {required List<Hike> bestHikesNearby,
      required List<Hike> bestHikesOfTheWorld,
      required this.ref})
      : super(GuestHomeScreenViewModel(
            bestHikesNearby: bestHikesNearby,
            bestHikesOfTheWorld: bestHikesOfTheWorld)) {
    ref
        .watch(bestHikesNearbyProvider)
        .whenData((hikes) => setBestHikesNearby(hikes));
    ref
        .watch(bestHikesOfTheWorldProvider)
        .whenData((hikes) => setBestHikesOfTheWorld(hikes));
  }

  setBestHikesNearby(List<Hike> hikes) {
    state = GuestHomeScreenViewModel(
        bestHikesNearby: hikes, bestHikesOfTheWorld: state.bestHikesOfTheWorld);
  }

  setBestHikesOfTheWorld(List<Hike> hikes) {
    state = GuestHomeScreenViewModel(
        bestHikesNearby: state.bestHikesNearby, bestHikesOfTheWorld: hikes);
  }
}

final guestHomeScreenMVPProvider =
    StateNotifierProvider<GuestHomeScreenPresenter, GuestHomeScreenViewModel>(
        (ref) {
  return GuestHomeScreenPresenter(
      bestHikesNearby: [], bestHikesOfTheWorld: [], ref: ref);
});
