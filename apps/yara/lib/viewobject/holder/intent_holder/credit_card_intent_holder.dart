import 'package:yara/provider/basket/basket_provider.dart';
import 'package:yara/provider/transaction/transaction_header_provider.dart';
import 'package:yara/provider/user/user_provider.dart';
import 'package:yara/viewobject/basket.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';

class CreditCardIntentHolder {
  const CreditCardIntentHolder(
      {required this.basketList,
      required this.couponDiscount,
      required this.psValueHolder,
      required this.transactionSubmitProvider,
      required this.userProvider,
      required this.basketProvider,
      required this.memoText,
      required this.publishKey,
      required this.isClickPickUpButton,
      required this.deliveryPickUpDate,
      required this.deliveryPickUpTime});

  final List<Basket> basketList;
  final String couponDiscount;
  final PsValueHolder psValueHolder;
  final TransactionHeaderProvider transactionSubmitProvider;
  final UserProvider userProvider;
  final BasketProvider basketProvider;
  final String memoText;
  final String publishKey;
  final bool isClickPickUpButton;
  final String deliveryPickUpDate;
  final String deliveryPickUpTime;
}
