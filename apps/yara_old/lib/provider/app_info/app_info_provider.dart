import 'package:yara/api/common/ps_resource.dart';
import 'package:yara/api/common/ps_status.dart';
import 'package:yara/provider/common/ps_provider.dart';
import 'package:yara/repository/app_info_repository.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:yara/viewobject/ps_app_info.dart';

class AppInfoProvider extends PsProvider {
  AppInfoProvider(
      {required AppInfoRepository repo, this.psValueHolder, int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    print('App Info Provider: $hashCode');
    isDispose = false;
  }

  AppInfoRepository? _repo;
  PsValueHolder? psValueHolder;

  final PsResource<PSAppInfo> _psAppInfo =
      PsResource<PSAppInfo>(PsStatus.NOACTION, '', null);

  PsResource<PSAppInfo> get categoryList => _psAppInfo;

  @override
  void dispose() {
    isDispose = true;
    print('App Info Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> loadDeleteHistory(Map<dynamic, dynamic> jsonMap) async {
    isLoading = true;

    final PsResource<PSAppInfo> psAppInfo =
        await _repo!.postDeleteHistory(jsonMap);

    return psAppInfo;
  }
}
