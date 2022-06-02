import 'package:flutter/material.dart';
import 'package:yaha/app/views/achievements/profile/widgets/wallet-icon-box-widget.dart';
import 'package:yaha/app/views/shared/shared.dart';

class HowToCreateWalletScreen extends StatelessWidget {
  const HowToCreateWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Don't have a wallet?",
          style: TextStyle(
              color: YahaColors.textColor,
              fontSize: YahaFontSizes.medium,
              fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const YahaBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: YahaSpaceSizes.general, right: YahaSpaceSizes.general),
          child: Column(
            children: const [
              Padding(
                  padding: EdgeInsets.only(
                      top: YahaSpaceSizes.semiLarge,
                      bottom: YahaSpaceSizes.semiLarge),
                  child: WalletIconBox(
                    height: YahaBoxSizes.heightSmall,
                    width: YahaBoxSizes.widthSmall,
                    icon: Icons.account_balance_wallet_rounded,
                    iconColor: YahaColors.primary,
                    iconSize: 72,
                    borderRadius: YahaBorderRadius.general,
                  )),
              Text(
                'Don’t worry, it’s really easy to create one. Unfortunately you can’t do it in the Yaha app. All you need to do is to follow the instructions on the wallet provider’s website and when you’re done come back to the Yaha app and connect your newly created wallet.',
                style: TextStyle(
                    color: YahaColors.textColor,
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
