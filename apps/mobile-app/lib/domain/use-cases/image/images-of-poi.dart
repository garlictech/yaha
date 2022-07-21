import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';

class ImagesOfPoiUsecases {
  final String poiId;
  final FutureProviderRef ref;

  Future<List<String>>? _imageUrls;

  ImagesOfPoiUsecases({required this.poiId, required this.ref});

  Future<List<String>> get imageUrls {
    final imageUsecases = ref.read(imageUsecasesProvider);
    final poiRepo = ref.read(poiRepositoryProvider);
    return _imageUrls ??= poiRepo.getPoi(poiId).then((poi) {
      return poi != null
          ? imageUsecases.getImagesAroundPoi(poi)
          : Future.value([]);
    }).then((images) {
      return images.map<String>((image) => image.card.url).toList();
    });
  }
}