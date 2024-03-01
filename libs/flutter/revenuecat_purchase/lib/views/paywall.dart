import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revenuecat_purchase/providers/current_offering.dart';
import '../providers/purchase_entitled.dart';
import '/model/paywall_styles.dart';

class Paywall extends ConsumerWidget {
  const Paywall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offering = ref.watch(currentOfferingProvider).asData?.value;

    final purchaseNotifier = ref.watch(purchaseEntitledProvider.notifier);
    debugPrint("Offering: $offering");
    if (offering == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            Container(
              height: 70.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  //color: kColorBar,
                  color: kColorAccent,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              child: const Center(
                  child: Text('Subscribe now', style: kTitleTextStyle)),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 32, bottom: 16, left: 16.0, right: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'To add new goals, you need to subscribe to the premium version of the app.',
                  style: kDescriptionTextStyle,
                ),
              ),
            ),
            ListView.builder(
              itemCount: offering.availablePackages.length,
              itemBuilder: (BuildContext context, int index) {
                var myProductList = offering.availablePackages;
                return Card(
                  color: Colors.black,
                  child: ListTile(
                      onTap: () async {
                        purchaseNotifier
                            .purchase(myProductList[index])
                            .then(() => Navigator.pop(context));
                      },
                      title: Text(
                        myProductList[index].storeProduct.title,
                        style: kTitleTextStyle,
                      ),
                      subtitle: Text(
                        myProductList[index].storeProduct.description,
                        style: kDescriptionTextStyle.copyWith(
                            fontSize: kFontSizeSuperSmall),
                      ),
                      trailing: Text(
                          myProductList[index].storeProduct.priceString,
                          style: kTitleTextStyle)),
                );
              },
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 32, bottom: 16, left: 16.0, right: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "You can cancel your subscription at any time. Current goals will remain active until the end of the subscription period.",
                  style: kDescriptionTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
