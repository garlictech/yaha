import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/states/image/bad_images.dart';

import '../../entities/hike/hike.dart';

part 'cached_hike.g.dart';

@riverpod
class CachedHike extends _$CachedHike {
  @override
  Future<Hike?> build(String hikeId) async {
    final badImages = ref.watch(badImagesProvider);

    Hike hike = await (state.value != null
        ? Future.value(state.value)
        : ref
            .read(hikeRepositoryProvider)
            .getHike(hikeId)
            .then((h) => Hike(hike: h)));

    final newImages = hike.route.images.where((image) =>
        {image.card, image.original, image.thumbnail}
            .difference(badImages)
            .length ==
        3);

    if (newImages.length != hike.route.images.length) {
      final newRoute = hike.route.copyWith(images: newImages.toList());
      hike = Hike(hike: hike.hike.copyWith(route: newRoute));
      state = AsyncData(hike);
    }

    return hike;
  }
}
/*final hikeProvider = FutureProvider.family<Hike, String>((ref, hikeId) async {
  return ref.read(hikeRepositoryProvider).getHike(hikeId);
});*/
