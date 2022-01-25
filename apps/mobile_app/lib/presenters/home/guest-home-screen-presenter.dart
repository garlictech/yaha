import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/models/ModelProvider.dart';
import 'package:yaha/viewmodels/hikes/guest-home-screen-viewmodel.dart';

class GuestHomeScreenPresenter extends StateNotifier<GuestHomeScreenViewModel> {
  GuestHomeScreenPresenter(
      {required List<Hike> bestHikesNearby,
      required List<Hike> bestHikesOfTheWorld})
      : super(GuestHomeScreenViewModel(
            bestHikesNearby: bestHikesNearby,
            bestHikesOfTheWorld: bestHikesOfTheWorld)) {}
}

final guestHomeScreenMVPProvider =
    StateNotifierProvider<GuestHomeScreenPresenter, GuestHomeScreenViewModel>(
        (ref) {
  final hikes = [
    Hike(id: 'id', description: [
      TextualDescription(
          languageKey: 'en_US',
          title: 'Tura',
          summary: 'Túrázás, vár, erdő, és barlang',
          type: TextualDescriptionType.markdown)
    ], imageUrls: [
      'assets/images/tura.png'
    ]),
    Hike(id: 'id', description: [
      TextualDescription(
          languageKey: 'en_US',
          title: 'Mátra',
          summary: 'Mátra, erdős hegyek túrázáshoz',
          type: TextualDescriptionType.markdown)
    ], imageUrls: [
      'assets/images/matra.png'
    ]),
    Hike(id: 'id', description: [
      TextualDescription(
          languageKey: 'en_US',
          title: 'Balaton§',
          summary: 'Nagy édesvizű tó üdülővárosokkal',
          type: TextualDescriptionType.markdown)
    ], imageUrls: [
      'assets/images/balaton.png'
    ]),
  ];

  return GuestHomeScreenPresenter(
      bestHikesNearby: hikes, bestHikesOfTheWorld: hikes);
});
