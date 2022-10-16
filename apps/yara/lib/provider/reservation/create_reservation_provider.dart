import 'dart:async';
import 'package:fluttermultirestaurant/api/common/ps_resource.dart';
import 'package:fluttermultirestaurant/api/common/ps_status.dart';
import 'package:fluttermultirestaurant/provider/common/ps_provider.dart';
import 'package:fluttermultirestaurant/repository/create_reservation_repository.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/api_status.dart';

import '../../viewobject/common/ps_value_holder.dart';

class CreateReservationProvider extends PsProvider {
  CreateReservationProvider(
      {required ReservationRepository repo,
      required this.psValueHolder,
      int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    print('Reservation Provider: $hashCode');

    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
    });
  }

 late ReservationRepository _repo;
  PsValueHolder psValueHolder;
  String? reservationDate = '';
  String? reservationTime ='';
  String? selectedShopId='';
  String? selectedShopName='';
  PsResource<ApiStatus> _reservation =
      PsResource<ApiStatus>(PsStatus.NOACTION, '', null);
  PsResource<ApiStatus> get user => _reservation;

  @override
  void dispose() {
    isDispose = true;
    print('Reservation Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> postReservation(
    Map<dynamic, dynamic> jsonMap,
  ) async {
    isLoading = true;

    isConnectedToInternet = await Utils.checkInternetConnectivity();

    _reservation = await _repo.postReservation(
        jsonMap, isConnectedToInternet, PsStatus.PROGRESS_LOADING);

    return _reservation;
  }
}
