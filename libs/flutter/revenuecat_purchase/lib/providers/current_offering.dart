import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../components/native_dialog.dart';

part 'current_offering.g.dart';

GetIt getIt = GetIt.instance;

@riverpod
class CurrentOffering extends _$CurrentOffering {
  @override
  Future<Offering?> build() async {
    try {
      final offerings = await Purchases.getOfferings();
      return offerings.current;
    } on PlatformException catch (e) {
      final context = getIt<GlobalKey<NavigatorState>>().currentContext!;

      await showDialog(
          context: context,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: "Error",
              content: e.message ?? "Unknown error",
              buttonText: 'OK'));
      return null;
    }
  }
}
