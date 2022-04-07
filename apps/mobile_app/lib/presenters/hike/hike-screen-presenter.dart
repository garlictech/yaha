import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/providers/providers.dart';
import 'package:yaha/viewmodels/hikes/hike-screen-viewmodel.dart';

class HikeScreenPresenter extends StateNotifier<HikeScreenViewModel> {
  final ProviderReference ref;
  final Hike hike;

  HikeScreenPresenter({required this.ref, required this.hike})
      : super(HikeScreenViewModel()) {
    final imageUsecases = ref.read(imageUsecasesProvider);

    imageUsecases
        .getImagesAlongHike(hike.id)
        .then((images) => images.map((image) => image.card.url).toList())
        .then((imageUrls) => imageUrls.isEmpty
            ? imageUrls
            : [HikeScreenViewModel.imagePlaceholder])
        .then((imageUrls) => state = HikeScreenViewModel(imageUrls: imageUrls));
  }
}

final hikeScreenPresenter = StateNotifierProvider.family<HikeScreenPresenter,
    HikeScreenViewModel, Hike>((ref, hike) {
  return HikeScreenPresenter(ref: ref, hike: hike);
});
