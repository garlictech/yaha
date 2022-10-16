import 'package:flutter/cupertino.dart';
import 'package:fluttermultirestaurant/provider/delivery_cost/delivery_cost_provider.dart';
import 'package:fluttermultirestaurant/provider/shop_info/shop_info_provider.dart';
import 'package:fluttermultirestaurant/provider/user/user_provider.dart';
import 'package:fluttermultirestaurant/viewobject/basket.dart';

class DeliveryLocationIntentHolder {
  const DeliveryLocationIntentHolder({
    @required this.address,
    @required this.basketList,
    @required this.deliveryCostProvider,
    @required this.userProvider,
    @required this.shopInfoProvider,
  });
  final String? address;
  final List<Basket>? basketList;
  final DeliveryCostProvider? deliveryCostProvider;
  final UserProvider? userProvider;
  final ShopInfoProvider? shopInfoProvider;
}
