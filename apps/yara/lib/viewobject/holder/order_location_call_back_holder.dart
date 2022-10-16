import 'package:flutter/cupertino.dart';
import 'package:fluttermultirestaurant/viewobject/shipping_area.dart';

class OrderLocationCallBackHolder {
  const OrderLocationCallBackHolder({
    @required this.address,
    @required this.shippingArea
  });
  final String? address;
  final ShippingArea? shippingArea;
}