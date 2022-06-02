import 'package:flutter/material.dart';
import 'package:yaha/app/views/achievements/profile/widgets/wallet-logo-box-widget.dart';
import 'package:yaha/app/views/shared/shared.dart';

class ConnectWallet2Screen extends StatelessWidget {
  const ConnectWallet2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Connect a wallet',
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
                child: WalletLogoBox(
                  width: YahaBoxSizes.widthSmall,
                  height: YahaBoxSizes.heightSmall,
                  logo: 'assets/images/MetaMask_logo.png',
                  padding: YahaSpaceSizes.semiLarge,
                  borderRadius: YahaBorderRadius.general,
                ),
              ),
              Text(
                'Type in your wallet credentials',
                style: TextStyle(
                    color: YahaColors.textColor,
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: YahaSpaceSizes.large, bottom: YahaSpaceSizes.general),
                child: YahaTextField(title: 'Wallet ID'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: YahaSpaceSizes.semiLarge),
                child: YahaTextFieldPassword(title: 'Password'),
              ),
              YahaCtaBig(
                  title: 'Connect',
                  titleColor: Colors.white,
                  backgroundColor: YahaColors.primary)
            ],
          ),
        ),
      ),
    );
  }
}
