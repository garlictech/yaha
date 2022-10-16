import 'package:flutter/cupertino.dart';
import 'package:fluttermultirestaurant/viewobject/basket.dart';

class WhatsAppCheckoutIntentHolder {
  const WhatsAppCheckoutIntentHolder({
    @required this.basketList,
  });
  final List<Basket>? basketList;
}
