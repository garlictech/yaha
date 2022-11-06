import 'dart:async';
import 'package:yara/api/common/ps_resource.dart';
import 'package:yara/api/common/ps_status.dart';
import 'package:yara/api/ps_api_service.dart';
import 'package:yara/constant/ps_constants.dart';
import 'package:yara/db/sub_category_dao.dart';
import 'package:yara/repository/Common/ps_repository.dart';
import 'package:yara/viewobject/holder/sub_category_parameter_holder.dart';
import 'package:yara/viewobject/sub_category.dart';
import 'package:sembast/sembast.dart';

class SubCategoryRepository extends PsRepository {
  SubCategoryRepository(
      {required PsApiService psApiService,
      required SubCategoryDao subCategoryDao}) {
    _psApiService = psApiService;
    _subCategoryDao = subCategoryDao;
  }

 late PsApiService _psApiService;
 late SubCategoryDao _subCategoryDao;
  final String _primaryKey = 'id';

  Future<dynamic> insert(SubCategory subCategory) async {
    return _subCategoryDao.insert(_primaryKey, subCategory);
  }

  Future<dynamic> update(SubCategory subCategory) async {
    return _subCategoryDao.update(subCategory);
  }

  Future<dynamic> delete(SubCategory subCategory) async {
    return _subCategoryDao.delete(subCategory);
  }

  Future<dynamic> getSubCategoryListByCategoryId(
      StreamController<PsResource<List<SubCategory>>> subCategoryListStream,
      bool isConnectedToIntenet,
      int limit,
      int offset,
      PsStatus status,
      String categoryId,
      {bool isLoadFromServer = true}) async {
    final Finder finder = Finder(filter: Filter.equals('cat_id', categoryId));

    subCategoryListStream.sink
        .add(await _subCategoryDao.getAll(finder: finder, status: status));

    final PsResource<List<SubCategory>> _resource =
        await _psApiService.getSubCategoryList(limit, offset, categoryId);

    if (_resource.status == PsStatus.SUCCESS) {
      await _subCategoryDao.deleteWithFinder(finder);
      await _subCategoryDao.insertAll(_primaryKey, _resource.data!);
    } else {
      if (_resource.errorCode == PsConst.ERROR_CODE_10001) {
        await _subCategoryDao.deleteWithFinder(finder);
      }
    }
    subCategoryListStream.sink
        .add(await _subCategoryDao.getAll(finder: finder));
  }

  Future<dynamic> getSubCategoryListByKey(
      StreamController<PsResource<List<SubCategory>>> subCategoryListStream,
      bool isConnectedToIntenet,
      int limit,
      int offset,
      PsStatus status,
      SubCategoryParameterHolder holder,
      {bool isLoadFromServer = true}) async {
    final Finder finder = Finder();
    // Finder(filter: Filter.equals('cat_id', holder.searchTerm));
    subCategoryListStream.sink
        .add(await _subCategoryDao.getAll(finder: finder, status: status));

    final PsResource<List<SubCategory>> _resource = await _psApiService
        .getSubCategoryListByKey(limit, offset, holder.toMap());
    print('Length :${_resource.data!.length}');
    if (_resource.status == PsStatus.SUCCESS) {
      await _subCategoryDao.deleteWithFinder(finder);
      await _subCategoryDao.insertAll(_primaryKey, _resource.data!);
    } else {
      if (_resource.errorCode == PsConst.ERROR_CODE_10001) {
        await _subCategoryDao.deleteWithFinder(finder);
      }
    }
    subCategoryListStream.sink
        .add(await _subCategoryDao.getAll(finder: finder));
  }

  Future<dynamic> getNextPageSubCategoryListByKey(
      StreamController<PsResource<List<SubCategory>>> subCategoryListStream,
      bool isConnectedToIntenet,
      int limit,
      int offset,
      PsStatus status,
      SubCategoryParameterHolder holder,
      {bool isLoadFromServer = true}) async {
    final Finder finder = Finder();
    // Finder(filter: Filter.equals('cat_id', holder.searchTerm));
    subCategoryListStream.sink
        .add(await _subCategoryDao.getAll(finder: finder, status: status));

    final PsResource<List<SubCategory>> _resource = await _psApiService
        .getSubCategoryListByKey(limit, offset, holder.toMap());

    if (_resource.status == PsStatus.SUCCESS) {
      await _subCategoryDao.deleteWithFinder(finder);
      await _subCategoryDao.insertAll(_primaryKey, _resource.data!);
    } else {
      if (_resource.errorCode == PsConst.ERROR_CODE_10001) {
        await _subCategoryDao.deleteWithFinder(finder);
      }
    }
    subCategoryListStream.sink
        .add(await _subCategoryDao.getAll(finder: finder));
  }


  Future<dynamic> getAllSubCategoryListByCategoryId(
      StreamController<PsResource<List<SubCategory>>> subCategoryListStream,
      bool isConnectedToIntenet,
      PsStatus status,
      String categoryId,
      {bool isLoadFromServer = true}) async {
    final Finder finder = Finder(filter: Filter.equals('cat_id', categoryId));

    subCategoryListStream.sink
        .add(await _subCategoryDao.getAll(finder: finder, status: status));

    final PsResource<List<SubCategory>> _resource =
        await _psApiService.getAllSubCategoryList(categoryId);

    if (_resource.status == PsStatus.SUCCESS) {
      await _subCategoryDao.deleteWithFinder(finder);
      await _subCategoryDao.insertAll(_primaryKey, _resource.data!);
    } else {
      if (_resource.errorCode == PsConst.ERROR_CODE_10001) {
        await _subCategoryDao.deleteWithFinder(finder);
      }
    }
    subCategoryListStream.sink
        .add(await _subCategoryDao.getAll(finder: finder));
  }

  Future<dynamic> getNextPageSubCategoryList(
      StreamController<PsResource<List<SubCategory>>> subCategoryListStream,
      bool isConnectedToIntenet,
      int limit,
      int offset,
      PsStatus status,
      String categoryId,
      {bool isLoadFromServer = true}) async {
    final Finder finder = Finder(filter: Filter.equals('cat_id', categoryId));
    subCategoryListStream.sink
        .add(await _subCategoryDao.getAll(finder: finder, status: status));

    final PsResource<List<SubCategory>> _resource =
        await _psApiService.getSubCategoryList(limit, offset, categoryId);

    if (_resource.status == PsStatus.SUCCESS) {
      _subCategoryDao
          .insertAll(_primaryKey, _resource.data!)
          .then((dynamic data) async {
        subCategoryListStream.sink
            .add(await _subCategoryDao.getAll(finder: finder));
      });
    } else {
      subCategoryListStream.sink
          .add(await _subCategoryDao.getAll(finder: finder));
    }
  }
}
