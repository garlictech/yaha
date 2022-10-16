// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:fluttermultirestaurant/api/common/ps_status.dart';
import 'package:fluttermultirestaurant/api/ps_api_service.dart';
import 'package:fluttermultirestaurant/db/search_result_dao.dart';
import 'package:fluttermultirestaurant/repository/Common/ps_repository.dart';
import 'package:fluttermultirestaurant/viewobject/search_result.dart';
import 'package:sembast/sembast.dart';

import '../api/common/ps_resource.dart';

class SearchResultRepository extends PsRepository {
  SearchResultRepository({
      required PsApiService psApiService,
      required SearchResultDao searchResultDao}) {
    _apiService = psApiService;
    _searchResultDao = searchResultDao;
  }
  late PsApiService _apiService;
  late SearchResultDao _searchResultDao;
  String primaryKey = 'id';

  Future<dynamic> getSearchResult(
    StreamController<PsResource<SearchResult>> searchResultStream,
    bool isConnectedToInternet,
    int offset,
    PsStatus status,
    Map<String, dynamic> json,
  ) async {
    sinkSearchResultStream(
        searchResultStream,
        await _searchResultDao.getOne(
          finder: Finder(
            filter: Filter.equals(primaryKey, json['searchterm']),
          ),
          status: status,
        ));

    if (isConnectedToInternet) {
      final PsResource<SearchResult> _resource =
          await _apiService.getSearchResult(json, offset);

      final SearchResult searchResult = SearchResult(
        id: json['searchterm'],
        categories: _resource.data?.categories,
        subCategories: _resource.data?.subCategories,
        products: _resource.data?.products,
        shops: _resource.data?.shops,
      );
      await _searchResultDao.insert(primaryKey, searchResult);
      if (_resource.status == PsStatus.SUCCESS) {
        sinkSearchResultStream(searchResultStream, _resource);
      }
    }
  }
}

void sinkSearchResultStream(
    StreamController<PsResource<SearchResult>> searchResultStream,
    PsResource<SearchResult> data) {
  if (searchResultStream != null && data != null) {
    searchResultStream.sink.add(data);
  }
}
