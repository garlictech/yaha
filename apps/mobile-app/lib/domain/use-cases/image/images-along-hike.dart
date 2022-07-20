import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/image-providers.dart';

class ImagesAlongHikeUsecases extends ChangeNotifier {
  static final List<String> _imageUrls = [
    'https://cdn2.iconfinder.com/data/icons/mountain-landscape-2/138/hiking_boots_hiking_logo_hiking_chair_hiking_drawing_hiking_day_hiking_flyer_hiking_in_winter-1024.png'
  ];

  List<String> imageUrls;

  final String hikeId;
  final ChangeNotifierProviderRef<ImagesAlongHikeUsecases> ref;

  ImagesAlongHikeUsecases({required this.hikeId, required this.ref})
      : imageUrls = ImagesAlongHikeUsecases._imageUrls {
    refreshImages();
  }

  void refreshImages() async {
    final imageUsecases = ref.read(imageUsecasesProvider);
    imageUrls = await imageUsecases.getImagesAlongHike(hikeId).then((images) {
      final urls = images.map<String>((image) => image.card.url).toList();
      return urls.isEmpty ? _imageUrls : urls;
    });
    notifyListeners();
  }

  get firstImageUrl {
    return imageUrls.first.isEmpty ? '' : imageUrls.first;
  }
}
