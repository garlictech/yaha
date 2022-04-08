import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/providers/providers.dart';

import '../../viewmodels/hikes/hike-screen-viewmodel.dart';

class HikeScreenPresenter extends StateNotifier<HikeScreenViewModel> {
  final ProviderReference ref;
  final Hike hike;

  HikeScreenPresenter({required this.ref, required this.hike})
      : super(HikeScreenViewModel()) {
    final imageUsecases = ref.read(imageUsecasesProvider);

    imageUsecases
        .getImagesAlongHike(hike.id)
        .then((images) => images.map((image) => image.card.url).toList())
        .then((imageUrls) {
      debugPrint("***");
      debugPrint(imageUrls.toString());
      return imageUrls.isEmpty
          ? [HikeScreenViewModel.imagePlaceholder]
          : imageUrls;
    }).then((imageUrls) => state = HikeScreenViewModel(imageUrls: imageUrls));
  }
}

final hikeScreenPresenter = StateNotifierProvider.family<HikeScreenPresenter,
    HikeScreenViewModel, Hike>((ref, hike) {
  return HikeScreenPresenter(ref: ref, hike: hike);
});
