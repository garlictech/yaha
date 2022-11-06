import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:yara/config/ps_colors.dart';
import 'package:yara/config/ps_config.dart';
import 'package:yara/constant/ps_dimens.dart';
import 'package:yara/constant/route_paths.dart';
import 'package:yara/provider/shop/new_shop_provider.dart';
import 'package:yara/ui/common/dialog/warning_dialog_view.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/product_list_intent_holder.dart';
import 'package:yara/viewobject/holder/product_parameter_holder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// ignore: library_prefixes
import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMap;
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class HomeLocationWidget extends StatefulWidget {
  const HomeLocationWidget(
      {Key? key,

      /// If set, enable the FusedLocationProvider on Android
      required this.androidFusedLocation,
      required this.textEditingController,
      // @required this.newShopProvider,
      required this.searchTextController,
      required this.valueHolder})
      : super(key: key);

  final bool androidFusedLocation;
  final TextEditingController textEditingController;
  // final NewShopProvider newShopProvider;
  final TextEditingController searchTextController;
  final PsValueHolder valueHolder;

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<HomeLocationWidget> {
  String address = '';
  Position? _currentPosition;
  NewShopProvider? newShopProvider;
  // final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();

    _initCurrentLocation();
  }

  // Future<void> _handleLocationPermission() async {
  //     final ServiceStatus serviceStatus =
  //         await Permission.locationWhenInUse.serviceStatus;
  //     final bool isGpsOn = serviceStatus == ServiceStatus.enabled;
  //     if (!isGpsOn) {
  //       showDialog<dynamic>(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return WarningDialog(
  //               message: Utils.getString(context, 'map_pin__open_gps'),
  //               onPressed: () {},
  //             );
  //           });
  //       return;
  //     }

  //     final PermissionStatus status =
  //         await Permission.locationWhenInUse.request();
  //     if (status == PermissionStatus.granted) {
  //       await loadAddress();
  //     } else if (status == PermissionStatus.denied) {
  //       showDialog<dynamic>(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return WarningDialog(
  //               message: Utils.getString(context, 'map_pin__open_gps'),
  //               onPressed: () {},
  //             );
  //           });
  //     } else if (status == PermissionStatus.permanentlyDenied) {
  //       await openAppSettings();
  //     }
  //   }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return WarningDialog(
            message: Utils.getString(context, 'map_pin__open_gps'),
            onPressed: () {},
          );
        });
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future<bool>.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
        return Future<bool>.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final bool hasPermission = await _handleLocationPermission();

    if (!hasPermission) {
      return;
    }
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium,
            forceAndroidLocationManager: !widget.androidFusedLocation)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      loadAddress();
    }).catchError((dynamic e) {
      debugPrint(e);
    });
  }


  Future<void> loadAddress() async {
    if (_currentPosition != null) {
      if (widget.textEditingController.text == '') {
        await placemarkFromCoordinates(
                _currentPosition!.latitude, _currentPosition!.longitude)
            .then((List<Placemark> placemarks) {
          final Placemark place = placemarks[0];
          setState(() {
            address =
              '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
            widget.textEditingController.text = address;
          });
        }).catchError((dynamic e) {
          debugPrint(e);
        });
      } else {
        address = widget.textEditingController.text;
      }
    }
  }


  // dynamic loadAddress() async {
  //   if (_currentPosition != null) {
  //     if (widget.textEditingController.text == '') {
        
  //       try {
  //         final Address locationAddress = await GeoCode().reverseGeocoding(
  //             latitude: _currentPosition!.latitude,
  //             longitude: _currentPosition!.longitude);
  //         if (locationAddress.streetAddress != null &&
  //             locationAddress.countryName != null) {
  //           address =
  //               '${locationAddress.streetAddress}  \n, ${locationAddress.countryName}';
  //         } else {
  //           address = locationAddress.region!;
  //         }
  //       } catch (e) {
  //         address = '';
  //         print(e);
  //       }
  //       setState(() {
  //         widget.textEditingController.text = address;
  //       });
  //     } else {
  //       address = widget.textEditingController.text;
  //     }
  //   }
  // }

  // Platform messages are asynchronous, so we initialize in an async method.
  dynamic _initCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium,
            forceAndroidLocationManager: !widget.androidFusedLocation)
        .then((Position position) {
      if (mounted) {
        setState(() {
          _currentPosition = position;
        });

        newShopProvider!.shopNearYouParameterHolder.lat =
            _currentPosition!.latitude.toString();
        newShopProvider!.shopNearYouParameterHolder.lng =
            _currentPosition!.longitude.toString();
        newShopProvider!
            .loadShopList(newShopProvider!.shopNearYouParameterHolder);
      }
    }).catchError((Object e) {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    loadAddress();
    newShopProvider = Provider.of<NewShopProvider>(context);
    return Container(
      color: PsColors.backgroundColor,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: PsColors.backgroundColor,
                  margin: const EdgeInsets.only(
                    left: PsDimens.space6,
                    right: PsDimens.space6,
                    // bottom: PsDimens.space8
                  ),
                  child: Card(
                    elevation: 0.0,
                    shape: const BeveledRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(PsDimens.space8)),
                    ),
                    color: PsColors.baseLightColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                (widget.textEditingController.text == '')
                                    ? Utils.getString(
                                        context, 'dashboard__open_gps')
                                    : widget.textEditingController.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        letterSpacing: 0.8,
                                        fontSize: 16,
                                        height: 1.3),
                                        maxLines: 3,
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: PsDimens.space44,
                              width: PsDimens.space44,
                              child: Icon(
                                Icons.gps_fixed,
                                color: PsColors.mainColor,
                                size: PsDimens.space20,
                              ),
                            ),
                            onTap: () async {
                              // if (newShopProvider!
                              //         .shopNearYouParameterHolder.lat ==
                              //     null) {
                                  await _getCurrentPosition();
                                // showDialog<dynamic>(
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return ConfirmDialogView(
                                //           description: Utils.getString(
                                //               context, 'map_pin__open_gps'),
                                //           leftButtonText: Utils.getString(
                                //               context,
                                //               'home__logout_dialog_cancel_button'),
                                //           rightButtonText: Utils.getString(
                                //               context,
                                //               'home__logout_dialog_ok_button'),
                                //           onAgreeTap: () async {
                                //             Navigator.pop(context);
                                //           });
                                //     });
                              // } else {
                              //   loadAddress();
                              // }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: PsColors.backgroundColor,
                  margin: const EdgeInsets.only(
                    left: PsDimens.space6,
                    right: PsDimens.space6,
                    // bottom: PsDimens.space8
                  ),
                  child: Card(
                    elevation: 0.0,
                    shape: const BeveledRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(PsDimens.space8)),
                    ),
                    color: PsColors.baseLightColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                Utils.getString(
                                    context, 'dashboard__explore_shops_on_map'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        letterSpacing: 0.8,
                                        fontSize: 16,
                                        height: 1.3),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: PsDimens.space44,
                              width: PsDimens.space44,
                              child: Icon(
                                Icons.location_on,
                                color: PsColors.mainColor,
                                size: PsDimens.space20,
                              ),
                            ),
                            onTap: () async {
                              // if (newShopProvider!
                              //         .shopNearYouParameterHolder.lat ==
                              //     null) {
                                  await _getCurrentPosition();
                                // showDialog<dynamic>(
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return ConfirmDialogView(
                                //           description: Utils.getString(
                                //               context, 'map_pin__open_gps'),
                                //           leftButtonText: Utils.getString(
                                //               context,
                                //               'home__logout_dialog_cancel_button'),
                                //           rightButtonText: Utils.getString(
                                //               context,
                                //               'home__logout_dialog_ok_button'),
                                //           onAgreeTap: () async {
                                //             Navigator.pop(context);
                                //           });
                                //     });
                              // } else {
                              //   loadAddress();
                                // final double lat = double.parse(_currentPosition.latitude);
                                // final double lng = double.parse(newShopProvider!
                                //     .shopNearYouParameterHolder.lng!);
                                if (PsConfig.isUseGoogleMap) {
                                  final googleMap.LatLng latLng =
                                      googleMap.LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
                                  Navigator.pushNamed(
                                    context,
                                    RoutePaths.nearestShopGoogleMap,
                                    arguments: latLng,
                                  );
                                } else {
                                  final LatLng latLng = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);

                                  Navigator.pushNamed(
                                    context,
                                    RoutePaths.nearestShopMap,
                                    arguments: latLng,
                                  );
                                }
                              // }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          _SearchWidget(
              addressController: widget.searchTextController,
              valueHolder: widget.valueHolder,
              newShopProvider: newShopProvider!),
          const SizedBox(height: PsDimens.space8),
        ],
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget(
      {required this.addressController,
      required this.valueHolder,
      required this.newShopProvider});
  final TextEditingController addressController;
  final PsValueHolder valueHolder;
  final NewShopProvider newShopProvider;
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (newShopProvider != null)
      return Container(
        color: PsColors.backgroundColor,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: PsDimens.space4,
            ),
            // Flexible(
            //     child: PsTextFieldWidgetWithIcon(
            //         hintText:
            //             Utils.getString(context, 'home__bottom_app_bar_search'),
            //         textEditingController: addressController,
            //         psValueHolder: valueHolder,
            //         textInputAction: TextInputAction.search,
            //         currentPosition: (newShopProvider != null &&
            //                 newShopProvider.shopNearYouParameterHolder !=
            //                     null &&
            //                 newShopProvider.shopNearYouParameterHolder.lat !=
            //                     null &&
            //                 newShopProvider.shopNearYouParameterHolder.lat !=
            //                     '')
            //             ? LatLng(
            //                 double.parse(
            //                     newShopProvider.shopNearYouParameterHolder.lat),
            //                 double.parse(
            //                     newShopProvider.shopNearYouParameterHolder.lng),
            //               )
            //             : LatLng(0, 0))),
            Flexible(
              child: InkWell(
                  child: Container(
                      height: PsDimens.space44,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          bottom: PsDimens.space10,
                          top: PsDimens.space10,
                          left: PsDimens.space16,
                          right: PsDimens.space4),
                      decoration: BoxDecoration(
                        color: PsColors.baseDarkColor,
                        borderRadius: BorderRadius.circular(PsDimens.space4),
                        border: Border.all(color: PsColors.mainDividerColor),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin:
                                  const EdgeInsets.only(left: PsDimens.space10),
                              child: Icon(
                                Icons.search,
                                color: PsColors.iconColor,
                                size: 25,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: PsDimens.space8),
                              child: Text(
                                  Utils.getString(
                                      context, 'home__bottom_app_bar_search'),
                                  style: Theme.of(context).textTheme.subtitle2),
                            ),
                          ])),
                  onTap: () {
                    Navigator.pushNamed(context, RoutePaths.searchHistory);
                  }),
            ),
            Container(
              height: PsDimens.space44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: PsColors.baseDarkColor,
                borderRadius: BorderRadius.circular(PsDimens.space4),
                border: Border.all(color: PsColors.mainDividerColor),
              ),
              child: InkWell(
                  child: Container(
                    height: double.infinity,
                    width: PsDimens.space44,
                    child: Icon(
                      Octicons.settings,
                      color: PsColors.mainColor,
                      size: PsDimens.space20,
                    ),
                  ),
                  onTap: () async {
                    final ProductParameterHolder productParameterHolder =
                        ProductParameterHolder().getLatestParameterHolder();
                    productParameterHolder.searchTerm = addressController.text;
                    Utils.psPrint(productParameterHolder.searchTerm!);
                    Navigator.pushNamed(context, RoutePaths.dashboardsearchFood,
                        arguments: ProductListIntentHolder(
                            appBarTitle: Utils.getString(
                                context, 'home_search__app_bar_title'),
                            productParameterHolder: productParameterHolder));
                  }),
            ),
            const SizedBox(
              width: PsDimens.space16,
            ),
          ],
        ),
      );
    else
      return Container();
  }
}
