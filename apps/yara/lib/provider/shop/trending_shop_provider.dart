import 'dart:async';
import 'package:fluttermultirestaurant/api/common/ps_resource.dart';
import 'package:fluttermultirestaurant/api/common/ps_status.dart';
import 'package:fluttermultirestaurant/provider/common/ps_provider.dart';
import 'package:fluttermultirestaurant/repository/shop_repository.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/api_status.dart';
import 'package:fluttermultirestaurant/viewobject/holder/shop_parameter_holder.dart';
import 'package:fluttermultirestaurant/viewobject/shop.dart';

class TrendingShopProvider extends PsProvider {
  TrendingShopProvider({required ShopRepository repo, int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    print('TrendingShopProvider : $hashCode');
    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
    });

    shopListStream = StreamController<PsResource<List<Shop>>>.broadcast();
    subscription =
        shopListStream.stream.listen((PsResource<List<Shop>> resource) {
      updateOffset(resource.data!.length);

      _shopList = resource;

      if (resource.status != PsStatus.BLOCK_LOADING &&
          resource.status != PsStatus.PROGRESS_LOADING) {
        isLoading = false;
      }

      if (!isDispose) {
        notifyListeners();
      }
    });
  }
 late ShopRepository _repo;
  PsResource<List<Shop>> _shopList =
      PsResource<List<Shop>>(PsStatus.NOACTION, '', <Shop>[]);

  PsResource<List<Shop>> get shopList => _shopList;
 late StreamSubscription<PsResource<List<Shop>>> subscription;
 late StreamController<PsResource<List<Shop>>> shopListStream;

  PsResource<ApiStatus> _apiStatus =
      PsResource<ApiStatus>(PsStatus.NOACTION, '', null);
  PsResource<ApiStatus> get user => _apiStatus;

  @override
  void dispose() {
    subscription.cancel();
    isDispose = true;
    print('Propular Shop Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> loadShopList() async {
    isLoading = true;

    isConnectedToInternet = await Utils.checkInternetConnectivity();

    await _repo.getShopList(
        shopListStream,
        isConnectedToInternet,
        limit,
        offset,
        PsStatus.PROGRESS_LOADING,
        ShopParameterHolder().getTrendingShopParameterHolder());
  }

  Future<dynamic> nextShopList() async {
    isConnectedToInternet = await Utils.checkInternetConnectivity();

    if (!isLoading && !isReachMaxData) {
      super.isLoading = true;

      await _repo.getShopList(
          shopListStream,
          isConnectedToInternet,
          limit,
          offset,
          PsStatus.PROGRESS_LOADING,
          ShopParameterHolder().getTrendingShopParameterHolder());
    }
  }

  Future<dynamic> refreshShopList() async {
    isLoading = true;
    updateOffset(0);

    isConnectedToInternet = await Utils.checkInternetConnectivity();
    await _repo.getShopList(
        shopListStream,
        isConnectedToInternet,
        limit,
        0,
        PsStatus.PROGRESS_LOADING,
        ShopParameterHolder().getTrendingShopParameterHolder());
  }

  Future<dynamic> postTouchCount(
    Map<dynamic, dynamic> jsonMap,
  ) async {
    isLoading = true;

    isConnectedToInternet = await Utils.checkInternetConnectivity();

    _apiStatus = await _repo.postTouchCount(
        jsonMap, isConnectedToInternet, PsStatus.PROGRESS_LOADING);

    return _apiStatus;
  }
}