import 'package:flutter_yaha_lib/app/app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'some_hikes_nearby_controller.g.dart';

@riverpod
class SomeHikesNearbyController extends _$SomeHikesNearbyController {
  @override
  FutureOr<List<String>> build() async {
    return await _refresh();
  }

  refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _refresh());
  }

  Future<List<String>> _refresh() {
    return ref
        .read(searchTracksAroundCurrentLocationUseCaseProvider.notifier)
        .execute();
  }
}
