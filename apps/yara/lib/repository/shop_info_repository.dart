import 'dart:async';
import 'package:fluttermultirestaurant/api/common/ps_resource.dart';
import 'package:fluttermultirestaurant/api/common/ps_status.dart';
import 'package:fluttermultirestaurant/api/ps_api_service.dart';
import 'package:fluttermultirestaurant/constant/ps_constants.dart';
import 'package:fluttermultirestaurant/db/shop_info_dao.dart';
import 'package:fluttermultirestaurant/viewobject/shop_info.dart';
import 'package:sembast/sembast.dart';

import 'Common/ps_repository.dart';

class ShopInfoRepository extends PsRepository {
  ShopInfoRepository(
      {required PsApiService psApiService,
      required ShopInfoDao shopInfoDao}) {
    _psApiService = psApiService;
    _shopInfoDao = shopInfoDao;
  }

  String primaryKey = 'id';
 late PsApiService _psApiService;
 late ShopInfoDao _shopInfoDao;

  Future<dynamic> insert(ShopInfo shopInfo) async {
    return _shopInfoDao.insert(primaryKey, shopInfo);
  }

  Future<dynamic> update(ShopInfo shopInfo) async {
    return _shopInfoDao.update(shopInfo);
  }

  Future<dynamic> delete(ShopInfo shopInfo) async {
    return _shopInfoDao.delete(shopInfo);
  }

  Future<dynamic> getShopInfo(
      StreamController<PsResource<ShopInfo>> shopInfoListStream,
      String shopId,
      bool isConnectedToInternet,
      PsStatus status,
      {bool isLoadFromServer = true}) async {
    final Finder finder = Finder(filter: Filter.equals('id', shopId));
    shopInfoListStream.sink
        .add(await _shopInfoDao.getOne(finder: finder, status: status));

    if (isConnectedToInternet) {
      final PsResource<ShopInfo> _resource =
          await _psApiService.getShopInfo(shopId);

      if (_resource.status == PsStatus.SUCCESS) {
        await _shopInfoDao.deleteAll();
        await _shopInfoDao.insert(primaryKey, _resource.data!);
      } else {
        if (_resource.errorCode == PsConst.ERROR_CODE_10001) {
          await _shopInfoDao.deleteAll();
        }
      }
      shopInfoListStream.sink.add(await _shopInfoDao.getOne());
    }
  }
}
