import 'package:flutter/cupertino.dart';
import 'package:yara/viewobject/basket.dart';

class WhatsAppCheckoutIntentHolder {
  const WhatsAppCheckoutIntentHolder({
    @required this.basketList,
  });
  final List<Basket>? basketList;
}
