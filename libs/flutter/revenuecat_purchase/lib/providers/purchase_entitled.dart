import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';

import '../revenuecat_config.dart';
import 'is_subscription_purchased.dart';

part 'purchase_entitled.g.dart';

GetIt getIt = GetIt.instance;

@riverpod
class PurchaseEntitled extends _$PurchaseEntitled {
  final entitlementID = getIt<RevenuecatConfig>().entitlementId;

  @override
  bool build() {
    return false;
  }

  purchase(Package package) async {
    try {
      CustomerInfo customerInfo = await Purchases.purchasePackage(package);
      EntitlementInfo? entitlement =
          customerInfo.entitlements.all[entitlementID];
      ref
          .read(isSubscriptionPurchasedProvider.notifier)
          .setPurchased(entitlement?.isActive ?? false);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
