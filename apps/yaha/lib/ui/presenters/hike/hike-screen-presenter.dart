import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';

import '../../viewmodels/hikes/hike-screen-viewmodel.dart';

class HikeScreenPresenter extends StateNotifier<HikeScreenViewModel> {
  final ProviderReference ref;
  final Hike hike;

  HikeScreenPresenter({required this.ref, required this.hike})
      : super(HikeScreenViewModel());
}

final hikeScreenPresenter = StateNotifierProvider.family<HikeScreenPresenter,
    HikeScreenViewModel, Hike>((ref, hike) {
  return HikeScreenPresenter(ref: ref, hike: hike);
});
