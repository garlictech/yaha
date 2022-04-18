import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/entities/poi/poi_entity.dart';
import '../../../providers/image-providers.dart';

class ImagesOfPoiUsecases extends ChangeNotifier {
  final Poi poi;
  final ChangeNotifierProviderRef<ImagesOfPoiUsecases> ref;

  List<String>? imageUrls;

  ImagesOfPoiUsecases({required this.poi, required this.ref}) {
    refreshImages();
  }

  void refreshImages() async {
    final imageUsecases = ref.read(imageUsecasesProvider);
    imageUrls = await imageUsecases.getImagesAroundPoi(poi).then(
        (images) => images.map<String>((image) => image.card.url).toList());
    notifyListeners();
  }

  get firstImageUrl {
    return imageUrls?.first;
  }
}
