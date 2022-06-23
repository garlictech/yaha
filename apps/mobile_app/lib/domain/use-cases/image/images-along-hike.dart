import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/image-providers.dart';

class ImagesAlongHikeUsecases extends ChangeNotifier {
  List<String> imageUrls = [
    'https://cdn2.iconfinder.com/data/icons/mountain-landscape-2/138/hiking_boots_hiking_logo_hiking_chair_hiking_drawing_hiking_day_hiking_flyer_hiking_in_winter-1024.png'
  ];

  final String hikeId;
  final ChangeNotifierProviderRef<ImagesAlongHikeUsecases> ref;

  ImagesAlongHikeUsecases({required this.hikeId, required this.ref}) {
    refreshImages();
  }

  void refreshImages() async {
    final imageUsecases = ref.read(imageUsecasesProvider);
    imageUrls = await imageUsecases.getImagesAlongHike(hikeId).then(
        (images) => images.map<String>((image) => image.card.url).toList());
    notifyListeners();
  }

  get firstImageUrl {
    return imageUrls.first.isEmpty ? '' : imageUrls.first;
  }
}
