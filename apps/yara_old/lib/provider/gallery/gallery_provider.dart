import 'dart:async';
import 'package:yara/api/common/ps_resource.dart';
import 'package:yara/api/common/ps_status.dart';
import 'package:yara/provider/common/ps_provider.dart';
import 'package:yara/repository/gallery_repository.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/default_photo.dart';

class GalleryProvider extends PsProvider {
  GalleryProvider({required GalleryRepository repo, int limit = 0})
      : super(repo, limit) {
    _repo = repo;

    print('Gallery Provider: $hashCode');

    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
    });

    galleryListStream =
        StreamController<PsResource<List<DefaultPhoto>>>.broadcast();
    subscription = galleryListStream.stream
        .listen((PsResource<List<DefaultPhoto>> resource) {
      updateOffset(resource.data!.length);

      _galleryList = resource;

      if (resource.status != PsStatus.BLOCK_LOADING &&
          resource.status != PsStatus.PROGRESS_LOADING) {
        isLoading = false;
      }

      if (!isDispose) {
        notifyListeners();
      }
    });
  }

 late GalleryRepository _repo;

  PsResource<List<DefaultPhoto>> _galleryList =
      PsResource<List<DefaultPhoto>>(PsStatus.NOACTION, '', <DefaultPhoto>[]);

  PsResource<List<DefaultPhoto>> get galleryList => _galleryList;
  late StreamSubscription<PsResource<List<DefaultPhoto>>> subscription;
 late StreamController<PsResource<List<DefaultPhoto>>> galleryListStream;
  @override
  void dispose() {
    subscription.cancel();
    isDispose = true;
    print('Gallery Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> loadImageList(
    String parentImgId,
  ) async {
    isLoading = true;

    isConnectedToInternet = await Utils.checkInternetConnectivity();
    await _repo.getAllImageList(galleryListStream, isConnectedToInternet,
        parentImgId, limit, offset, PsStatus.PROGRESS_LOADING);
  }

  Future<void> resetGalleryList(
    String parentImgId,
  ) async {
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    isLoading = true;

    updateOffset(0);

    await _repo.getAllImageList(galleryListStream, isConnectedToInternet,
        parentImgId, limit, offset, PsStatus.PROGRESS_LOADING);
  }
}
