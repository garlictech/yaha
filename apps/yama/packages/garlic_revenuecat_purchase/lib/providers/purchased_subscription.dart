import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';

import '../views/paywall.dart';
import 'is_subscription_purchased.dart';

part 'purchased_subscription.g.dart';

GetIt getIt = GetIt.instance;

enum PurchaseState { working, error, purchased }

@riverpod
class PurchasedSubscription extends _$PurchasedSubscription {
  @override
  PurchaseState build() {
    ref.watch(isSubscriptionPurchasedProvider).whenData((isPurchased) {
      debugPrint("Purchased: $isPurchased");
      if (!isPurchased) {
        purchase();
      } else {
        state = PurchaseState.purchased;
      }
    }).whenOrNull(loading: () {
      debugPrint("Loading");
      state = PurchaseState.working;
    }, error: (error, stack) {
      debugPrint("Loading");
      state = PurchaseState.error;
    }, data: (data) {
      state = PurchaseState.error;
    });
    return PurchaseState.working;
  }

  purchase() {
    final context = getIt<GlobalKey<NavigatorState>>().currentContext!;

    return showModalBottomSheet(
      useRootNavigator: true,
      isDismissible: true,
      isScrollControlled: true,
      //backgroundColor: kColorBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return const Paywall();
        });
      },
    );
  }
}
