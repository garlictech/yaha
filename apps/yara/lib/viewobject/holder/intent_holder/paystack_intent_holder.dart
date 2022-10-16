import 'package:fluttermultirestaurant/provider/basket/basket_provider.dart';
import 'package:fluttermultirestaurant/provider/transaction/transaction_header_provider.dart';
import 'package:fluttermultirestaurant/provider/user/user_provider.dart';
import 'package:fluttermultirestaurant/viewobject/basket.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_value_holder.dart';

class PayStackInterntHolder {
  const PayStackInterntHolder(
      {required this.basketList,
      required this.couponDiscount,
      required this.psValueHolder,
      required this.transactionSubmitProvider,
      required this.userLoginProvider,
      required this.basketProvider,
      required this.memoText,
      required this.publishKey,
      required this.paystackKey,
      required this.isClickPickUpButton,
      required this.deliveryPickUpDate,
      required this.deliveryPickUpTime,
      required this.basketTotalPrice,
      });

  final List<Basket> basketList;
  final String couponDiscount;
  final PsValueHolder psValueHolder;
  final TransactionHeaderProvider transactionSubmitProvider;
  final UserProvider userLoginProvider;
  final BasketProvider basketProvider;
  final String memoText;
  final String publishKey;
  final String paystackKey;
  final bool isClickPickUpButton;
  final String deliveryPickUpDate;
  final String deliveryPickUpTime;
  final double basketTotalPrice;
}
