import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermultirestaurant/config/ps_colors.dart';
import 'package:fluttermultirestaurant/config/ps_config.dart';
import 'package:fluttermultirestaurant/provider/shop_info/shop_info_provider.dart';
import 'package:fluttermultirestaurant/repository/shop_info_repository.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_value_holder.dart';
import 'package:provider/provider.dart';

import 'create_reservation_view.dart';

class CreateReservationContainerView extends StatefulWidget {
  const CreateReservationContainerView(
      {required this.shopId, required this.shopName});
  final String shopId;
  final String shopName;

  @override
  _CreateReservationContainerViewState createState() =>
      _CreateReservationContainerViewState();
}

class _CreateReservationContainerViewState
    extends State<CreateReservationContainerView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: PsConfig.animation_duration, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  ShopInfoProvider? shopInfoProvider;
  ShopInfoRepository? shopInfoRepository;
  PsValueHolder? valueHolder;

  @override
  Widget build(BuildContext context) {
    shopInfoRepository = Provider.of<ShopInfoRepository>(context);
    valueHolder = Provider.of<PsValueHolder>(context);
    Future<bool> _requestPop() {
      animationController!.reverse().then<dynamic>(
        (void data) {
          if (!mounted) {
            return Future<bool>.value(false);
          }
          Navigator.pop(context, true);
          return Future<bool>.value(true);
        },
      );
      return Future<bool>.value(false);
    }

    print(
        '............................Build UI Again ............................');
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle (
            statusBarIconBrightness : Utils.getBrightnessForAppBar(context)
          ),
          iconTheme: Theme.of(context)
              .iconTheme
              .copyWith(color: PsColors.mainColorWithWhite),
          title: Text(
              Utils.getString(context, 'home__menu_drawer_create_reservation'),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold)
                  .copyWith(color: PsColors.mainColorWithWhite)),
          elevation: 0,
        ),
        body: Container(
          color: PsColors.coreBackgroundColor,
          height: double.infinity,
          child: CreateReservationView(
              animationController: animationController!,
              shopId: widget.shopId,
              shopName: widget.shopName),
        ),
      ),
    );
  }
}
