import 'dart:async';
import 'package:yara/api/common/ps_resource.dart';
import 'package:yara/provider/common/ps_provider.dart';
import 'package:yara/repository/schedule_detail_repository.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:yara/viewobject/schedule_detail.dart';
import 'package:yara/viewobject/schedule_header.dart';

import '../../api/common/ps_status.dart';

class ScheduleDetailProvider extends PsProvider {
  ScheduleDetailProvider(
      {required ScheduleDetailRepository repo,
      required this.valueHolder,
      int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    Utils.checkInternetConnectivity()
        .then((bool value) => isConnectedToInternet = value);

    _scheduleDetailListStream =
        StreamController<PsResource<List<ScheduleDetail>>>.broadcast();

    _subscription = _scheduleDetailListStream.stream
        .listen((PsResource<List<ScheduleDetail>> resource) {
      updateOffset(resource.data!.length);
      _scheduleDetailList = resource;
      if (resource.status != PsStatus.BLOCK_LOADING &&
          resource.status != PsStatus.PROGRESS_LOADING) {
        isLoading = false;
      }

      if (!isDispose) {
        notifyListeners();
      }
    });
  }

  PsValueHolder valueHolder;
  late ScheduleDetailRepository _repo;
  PsResource<List<ScheduleDetail>> _scheduleDetailList =
      PsResource<List<ScheduleDetail>>(
          PsStatus.NOACTION, '', <ScheduleDetail>[]);
  PsResource<List<ScheduleDetail>> get scheduleDetailList =>
      _scheduleDetailList;
  late StreamController<PsResource<List<ScheduleDetail>>> _scheduleDetailListStream;
  late StreamSubscription<PsResource<List<ScheduleDetail>>> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    isDispose = true;
    super.dispose();
  }

  Future<dynamic> loadScheduleDetailList(ScheduleHeader scheduleHeader) async {
    isLoading = true;
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    await _repo.getAllScheduleDetailList(
        _scheduleDetailListStream,
        isConnectedToInternet,
        scheduleHeader,
        limit,
        offset,
        PsStatus.PROGRESS_LOADING);
  }

  Future<dynamic> loadnextScheduleDetailList(
      ScheduleHeader scheduleHeader) async {
    isConnectedToInternet = await Utils.checkInternetConnectivity();

    if (!isLoading && !isReachMaxData) {
      super.isLoading = true;
      await _repo.getNextPageScheduleDetailList(
          _scheduleDetailListStream,
          isConnectedToInternet,
          scheduleHeader,
          limit,
          offset,
          PsStatus.PROGRESS_LOADING);
    }
  }

  Future<void> resetScheduleDetailList(ScheduleHeader scheduleHeader) async {
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    isLoading = true;

    updateOffset(0);

    await _repo.getAllScheduleDetailList(
        _scheduleDetailListStream,
        isConnectedToInternet,
        scheduleHeader,
        limit,
        offset,
        PsStatus.PROGRESS_LOADING);

    isLoading = false;
  }
}
