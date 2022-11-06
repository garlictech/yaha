import 'package:flutter/cupertino.dart';
import 'package:yara/provider/delivery_cost/delivery_cost_provider.dart';
import 'package:yara/provider/shop_info/shop_info_provider.dart';
import 'package:yara/provider/user/user_provider.dart';
import 'package:yara/viewobject/basket.dart';

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
