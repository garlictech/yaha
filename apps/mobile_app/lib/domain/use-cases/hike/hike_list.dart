import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/domain.dart';

part "hike_list.g.dart";

@riverpod
class HikeList extends _$HikeList {
  @override
  List<Hike> build() {
    return [];
  }

  newStream(List<String> hikeIds) {
    state = hikeIds
        .map((id) => ref.watch(cachedHikeProvider(id)))
        .map((hikeState) => hikeState.data)
        .whereType<Hike>()
        .toList();
  }
}
