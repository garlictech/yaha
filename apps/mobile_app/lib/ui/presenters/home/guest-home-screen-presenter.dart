import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/providers/hike-providers.dart';

import '../../viewmodels/hikes/guest-home-screen-viewmodel.dart';

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
