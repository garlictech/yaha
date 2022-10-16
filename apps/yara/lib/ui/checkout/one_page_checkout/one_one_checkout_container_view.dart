import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermultirestaurant/config/ps_config.dart';
import 'package:fluttermultirestaurant/provider/shop_info/shop_info_provider.dart';
import 'package:fluttermultirestaurant/ui/checkout/one_page_checkout/one_page_checkout_view.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/basket.dart';


class OnePageCheckoutContainerView extends StatefulWidget {
   const OnePageCheckoutContainerView({
    Key? key,
    @required this.basketList,
    @required this.shopInfoProvider,
  }) : super(key: key);

  final List<Basket>? basketList;
  final ShopInfoProvider? shopInfoProvider;

  @override
  _OnePageCheckoutContainerViewState createState() =>
      _OnePageCheckoutContainerViewState();
}

class _OnePageCheckoutContainerViewState extends State<OnePageCheckoutContainerView>
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

  @override
  Widget build(BuildContext context) {
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
          iconTheme: Theme.of(context).iconTheme.copyWith(),
          title: Text(
            Utils.getString(context, 'checkout__app_bar_name'),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          elevation: 0,
        ),
        body: OnePageCheckoutView(
          basketList: widget.basketList!,
          shopInfoProvider: widget.shopInfoProvider,
        ),
      ),
    );
  }
}
