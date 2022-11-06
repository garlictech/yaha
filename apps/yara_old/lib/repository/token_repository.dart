import 'dart:async';
import 'package:yara/api/common/ps_resource.dart';
import 'package:yara/api/common/ps_status.dart';
import 'package:yara/api/ps_api_service.dart';
import 'package:yara/viewobject/api_status.dart';
import 'Common/ps_repository.dart';

class TokenRepository extends PsRepository {
  TokenRepository({
    required PsApiService psApiService,
  }) {
    _psApiService = psApiService;
  }
  String primaryKey = '';
late  PsApiService _psApiService;

  Future<PsResource<ApiStatus>> getToken(
      bool isConnectedToInternet, PsStatus status,
      {bool isLoadFromServer = true}) async {
    final PsResource<ApiStatus> _resource = await _psApiService.getToken();
    if (_resource.status == PsStatus.SUCCESS) {
      return _resource;
    } else {
      final Completer<PsResource<ApiStatus>> completer =
          Completer<PsResource<ApiStatus>>();
      completer.complete(_resource);
      return completer.future;
    }
  }
}
