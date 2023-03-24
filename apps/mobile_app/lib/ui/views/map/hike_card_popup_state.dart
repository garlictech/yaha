import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hike_card_popup_state.g.dart';

@riverpod
class HikeCardPopupState extends _$HikeCardPopupState {
  @override
  String? build() {
    return null;
  }

  void showHike(String hikeId) {
    state = hikeId;
  }

  void hideHike() {
    state = null;
  }
}
