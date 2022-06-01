import 'package:flutter/material.dart';
import 'package:yaha/app/views/achievements/profile/widgets/wallet-icon-box-widget.dart';
import 'package:yaha/app/views/achievements/profile/widgets/wallet-logo-box-widget.dart';
import 'package:yaha/app/views/shared/shared.dart';

class ConnectWallet1Screen extends StatelessWidget {
  const ConnectWallet1Screen({Key? key}) : super(key: key);

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
            children: [
              const Padding(
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
              const Text(
                'Choose your wallet',
                style: TextStyle(
                    color: YahaColors.textColor,
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.general),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: YahaFontSizes.xSmall,
                        color: YahaColors.textColor,
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(text: 'By continuing you accept our '),
                      TextSpan(
                        text: 'Terms & Contitions ',
                        style: TextStyle(
                            color: YahaColors.primary,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: 'and our '),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(
                            color: YahaColors.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: YahaSpaceSizes.xSmall,
                          bottom: YahaSpaceSizes.xSmall),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          WalletLogoBox(
                              width: 40.0,
                              height: 40.0,
                              logo: 'assets/images/MetaMask_logo.png'),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: YahaSpaceSizes.medium),
                              child: Text('MetaMask',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: YahaColors.primary,
                            size: YahaIconSizes.xLarge,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                      color: YahaColors.divider,
                      thickness: YahaBorderWidth.xxSmall),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: YahaSpaceSizes.xSmall,
                          bottom: YahaSpaceSizes.xSmall),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          WalletLogoBox(
                              width: 40.0,
                              height: 40.0,
                              logo: 'assets/images/coinbase-logo.png'),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: YahaSpaceSizes.medium),
                              child: Text('MetaMask',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: YahaColors.primary,
                            size: YahaIconSizes.xLarge,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                      color: YahaColors.divider,
                      thickness: YahaBorderWidth.xxSmall),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: YahaSpaceSizes.xSmall,
                          bottom: YahaSpaceSizes.xSmall),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          WalletIconBox(
                            width: 40.0,
                            height: 40.0,
                            icon: Icons.more_horiz_rounded,
                            iconSize: YahaIconSizes.large,
                            iconColor: YahaColors.textColor,
                            borderRadius: YahaBorderRadius.xSmall,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: YahaSpaceSizes.medium),
                              child: Text('MetaMask',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: YahaColors.primary,
                            size: YahaIconSizes.xLarge,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                      color: YahaColors.divider,
                      thickness: YahaBorderWidth.xxSmall),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: YahaSpaceSizes.xSmall,
                          bottom: YahaSpaceSizes.xSmall),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          WalletIconBox(
                            width: 40.0,
                            height: 40.0,
                            icon: Icons.question_mark_rounded,
                            iconSize: YahaIconSizes.small,
                            iconColor: YahaColors.textColor,
                            borderRadius: YahaBorderRadius.xSmall,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: YahaSpaceSizes.medium),
                              child: Text("I don't have a wallet",
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: YahaColors.primary,
                            size: YahaIconSizes.xLarge,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
