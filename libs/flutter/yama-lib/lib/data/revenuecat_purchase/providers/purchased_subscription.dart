import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'purchased_subscription.g.dart';

enum PurchaseState { working, error, purchased, notActive }

@riverpod
class PurchasedSubscription extends _$PurchasedSubscription {
  @override
  Future<PurchaseState> build() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    return customerInfo.entitlements.all[entitlementID]?.isActive
        ? PurchaseState.purchased
        : PurchaseState.notActive;
  }

  purchase() async {
    try {
      Offerings offerings = await Purchases.getOfferings();

      if (offerings.current != null && offerings.current!.annual != null) {
        await Purchases.purchasePackage(offerings.current!.annual!);
        state = PurchaseState.purchased;
      }
    } catch (e) {
      // Handle error
      debugPrint(e.toString());
      state = PurchaseState.error;
    }
  }
}
