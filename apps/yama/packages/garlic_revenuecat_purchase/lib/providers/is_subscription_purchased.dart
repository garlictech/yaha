import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';

import '../revenuecat_config.dart';

part 'is_subscription_purchased.g.dart';

GetIt getIt = GetIt.instance;

@riverpod
class IsSubscriptionPurchased extends _$IsSubscriptionPurchased {
  final entitlementID = getIt<RevenuecatConfig>().entitlementId;

  @override
  Future<bool> build() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    return customerInfo.entitlements.all[entitlementID]?.isActive == true;
  }

  setPurchased(bool newState) {
    state = AsyncValue.data(newState);
  }
}
