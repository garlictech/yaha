import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get_it/get_it.dart';

import 'package:purchases_flutter/purchases_flutter.dart';

import '/revenuecat_config.dart';
import '/store_config.dart';
import '/model/singletons_data.dart';

GetIt getIt = GetIt.instance;

Future<void> configureRevenuecat() async {
  @override
  final config = getIt<RevenuecatConfig>();
  await _configureRevenuecat(config);
}

Future<void> _configureRevenuecat(RevenuecatConfig config) async {
  if (Platform.isIOS || Platform.isMacOS) {
    StoreConfig(
      store: Store.appStore,
      apiKey: config.appleApiKey,
    );
  } else if (Platform.isAndroid) {
    // Run the app passing --dart-define=AMAZON=true
    const useAmazon = bool.fromEnvironment("amazon");
    StoreConfig(
      store: useAmazon ? Store.amazon : Store.playStore,
      apiKey: useAmazon ? config.amazonApiKey : config.googleApiKey,
    );
  }

  await _configureSDK(config);
}

Future<void> _configureSDK(RevenuecatConfig config) async {
  // Enable debug logs before calling `configure`.
  await Purchases.setLogLevel(LogLevel.debug);

  /*
    - appUserID is nil, so an anonymous ID will be generated automatically by the Purchases SDK. Read more about Identifying Users here: https://docs.revenuecat.com/docs/user-ids

    - observerMode is false, so Purchases will automatically handle finishing transactions. Read more about Observer Mode here: https://docs.revenuecat.com/docs/observer-mode
    */
  PurchasesConfiguration configuration;
  if (StoreConfig.isForAmazonAppstore()) {
    configuration = AmazonConfiguration(StoreConfig.instance.apiKey)
      ..appUserID = null
      ..observerMode = false;
  } else {
    configuration = PurchasesConfiguration(StoreConfig.instance.apiKey)
      ..appUserID = null
      ..observerMode = false;
  }
  await Purchases.configure(configuration);
  await _initPlatformState(config.entitlementId);
}

Future<void> _initPlatformState(String entitlementID) async {
  appData.appUserID = await Purchases.appUserID;

  Purchases.addCustomerInfoUpdateListener((customerInfo) async {
    appData.appUserID = await Purchases.appUserID;

    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    EntitlementInfo? entitlement = customerInfo.entitlements.all[entitlementID];
    appData.entitlementIsActive = entitlement?.isActive ?? false;
    debugPrint("appuserid: ${appData.appUserID}");
    debugPrint("entitlement: $entitlement");
  });
}
