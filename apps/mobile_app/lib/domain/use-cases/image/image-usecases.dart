import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/providers/providers.dart';
import 'package:async/async.dart';

import '../../entities/entities.dart';

abstract class ImageUsecases {
  Future<List<Image>> getImagesAlongHike(String hikeId);
  Future<String> getMainImageOfHike(String hikeId);
  Future<List<Image>> getImagesAroundPoi(Poi poi);
}

class ImageUsecasesImpl implements ImageUsecases {
  final ProviderReference ref;

  ImageUsecasesImpl({required this.ref});

  @override
  getImagesAlongHike(String hikeId) {
    final defaults = ref.read(defaultsProvider);
    final imageRepo = ref.read(imageRepositoryProvider);

    return imageRepo
        .searchImagesAroundHike(SearchSafeImagesAroundHikeInput(
            hikeId: hikeId,
            distanceInMeters: defaults.smallGeoBufferSizeInMeters))
        .then((res) {
      final futureGroup = FutureGroup<Image>();
      fv(r) => futureGroup.add(imageRepo.getImage(r));
      res.forEach(fv);
      futureGroup.close();
      return futureGroup.future;
    });
  }

  @override
  getMainImageOfHike(String hikeId) {
    return getImagesAlongHike(hikeId)
        .then((images) => images.map((image) => image.card.url).toList())
        .then((imageUrls) {
      final firstUrl = imageUrls.first;

      return firstUrl.isEmpty
          ? 'https://cdn2.iconfinder.com/data/icons/mountain-landscape-2/138/hiking_boots_hiking_logo_hiking_chair_hiking_drawing_hiking_day_hiking_flyer_hiking_in_winter-1024.png'
          : firstUrl;
    });
  }

  @override
  getImagesAroundPoi(Poi poi) {
    final defaults = ref.read(defaultsProvider);
    final imageRepo = ref.read(imageRepositoryProvider);

    return imageRepo
        .searchImagesAroundLocation(SearchByRadiusInput(
            location: poi.location,
            objectType: 'image',
            radiusInMeters: defaults.poiImageSearchRadiusInMeters))
        .then((res) {
      final futureGroup = FutureGroup<Image>();
      fv(r) => futureGroup.add(imageRepo.getImage(r));
      res.forEach(fv);
      futureGroup.close();
      return futureGroup.future;
    });
  }
}
