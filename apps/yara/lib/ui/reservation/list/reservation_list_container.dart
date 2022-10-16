import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermultirestaurant/config/ps_colors.dart';
import 'package:fluttermultirestaurant/config/ps_config.dart';
import 'package:fluttermultirestaurant/provider/shop_info/shop_info_provider.dart';
import 'package:fluttermultirestaurant/repository/shop_info_repository.dart';
import 'package:fluttermultirestaurant/ui/reservation/list/reservation_list_view.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_value_holder.dart';
import 'package:provider/provider.dart';

class ReservationListContainerView extends StatefulWidget {
  @override
  _ReservationListContainerViewState createState() =>
      _ReservationListContainerViewState();
}

class _ReservationListContainerViewState
    extends State<ReservationListContainerView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
 final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
  PsValueHolder ?valueHolder;

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
              Utils.getString(context, 'home__menu_drawer_reservation_list'),
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
          child: ReservationListView(
              animationController: animationController!,
              scaffoldKey: scaffoldKey),
        ),
      ),
    );
  }
}
