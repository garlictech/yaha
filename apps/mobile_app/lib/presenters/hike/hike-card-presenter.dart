import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/providers/providers.dart';
import 'package:yaha/viewmodels/hikes/hike-card-viewmodel.dart';

class HikeCardPresenter extends StateNotifier<HikeCardViewModel> {
  final ProviderReference ref;
  final Hike hike;

  HikeCardPresenter({required this.ref, required this.hike})
      : super(HikeCardViewModel()) {
    final imageUsecases = ref.read(imageUsecasesProvider);
    imageUsecases
        .getMainImageOfHike(hike.id)
        .then((imageUrl) => state = HikeCardViewModel(mainHikeImage: imageUrl));
  }
}

final hikeCardPresenter =
    StateNotifierProvider.family<HikeCardPresenter, HikeCardViewModel, Hike>(
        (ref, hike) {
  return HikeCardPresenter(ref: ref, hike: hike);
});
