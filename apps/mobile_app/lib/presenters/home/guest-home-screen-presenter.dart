import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/providers/hike-providers.dart';
import 'package:yaha/viewmodels/hikes/guest-home-screen-viewmodel.dart';

class GuestHomeScreenPresenter extends StateNotifier<GuestHomeScreenViewModel> {
  GuestHomeScreenPresenter()
      : super(GuestHomeScreenViewModel(
            bestHikesNearbyProvider: bestHikesNearbyProvider,
            bestHikesOfTheWorldProvider: bestHikesOfTheWorldProvider));
}

final guestHomeScreenMVPProvider =
    StateNotifierProvider<GuestHomeScreenPresenter, GuestHomeScreenViewModel>(
        (ref) {
  return GuestHomeScreenPresenter();
});
