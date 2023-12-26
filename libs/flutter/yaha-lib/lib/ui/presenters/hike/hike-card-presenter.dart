import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import '../../viewmodels/hikes/hike-card-viewmodel.dart';

class HikeCardPresenter extends StateNotifier<HikeCardViewModel> {
  final Ref ref;
  final Hike hike;

  HikeCardPresenter({required this.ref, required this.hike})
      : super(HikeCardViewModel());
}

final hikeCardPresenter =
    StateNotifierProvider.family<HikeCardPresenter, HikeCardViewModel, Hike>(
        (ref, hike) {
  return HikeCardPresenter(ref: ref, hike: hike);
});