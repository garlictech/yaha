import 'dart:async';
import 'package:fluttermultirestaurant/api/common/ps_resource.dart';
import 'package:fluttermultirestaurant/api/common/ps_status.dart';
import 'package:fluttermultirestaurant/db/basket_dao.dart';
import 'package:fluttermultirestaurant/db/favourite_product_dao.dart';
import 'package:fluttermultirestaurant/db/history_dao.dart';
import 'package:fluttermultirestaurant/db/search_history_dao.dart';
import 'package:fluttermultirestaurant/db/transaction_detail_dao.dart';
import 'package:fluttermultirestaurant/db/transaction_header_dao.dart';
import 'package:fluttermultirestaurant/db/user_login_dao.dart';
import 'package:fluttermultirestaurant/repository/Common/ps_repository.dart';

import 'package:fluttermultirestaurant/viewobject/user_login.dart';

class DeleteTaskRepository extends PsRepository {
  Future<dynamic> deleteTask(
      StreamController<PsResource<List<UserLogin>>> allListStream) async {
    final FavouriteProductDao _favProductDao = FavouriteProductDao.instance;
    final UserLoginDao _userLoginDao = UserLoginDao.instance;
    final TransactionHeaderDao _transactionHeaderDao =
        TransactionHeaderDao.instance;
    final TransactionDetailDao _transactionDetailDao =
        TransactionDetailDao.instance;
    final BasketDao _basketDao = BasketDao.instance;
    final HistoryDao _historyDao = HistoryDao.instance;
    final SearchHistoryDao _searchHistoryDao = SearchHistoryDao.instance;
    await _favProductDao.deleteAll();
    await _userLoginDao.deleteAll();
    await _transactionHeaderDao.deleteAll();
    await _transactionDetailDao.deleteAll();
    await _basketDao.deleteAll();
    await _historyDao.deleteAll();
    await _searchHistoryDao.deleteAll();

    allListStream.sink
        .add(await _userLoginDao.getAll(status: PsStatus.SUCCESS));
  }
}
