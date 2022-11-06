import 'dart:async';
import 'package:yara/api/common/ps_resource.dart';
import 'package:yara/api/common/ps_status.dart';
import 'package:yara/provider/common/ps_provider.dart';
import 'package:yara/repository/token_repository.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/api_status.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';

class TokenProvider extends PsProvider {
  TokenProvider({
    required TokenRepository repo, 
    required this.psValueHolder,
    int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    print('Token Provider: $hashCode');

    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
    });
  }
  PsValueHolder psValueHolder;
  TokenRepository? _repo;
  @override
  void dispose() {
    isDispose = true;
    print('Token Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> loadToken() async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    final PsResource<ApiStatus> _resource =
        await _repo!.getToken(isConnectedToInternet, PsStatus.SUCCESS);
    return _resource;
  }
}
