import 'package:flutter/material.dart';
import 'package:yaha/app/views/achievements/profile/screens/connect-wallet-1-screen.dart';
import 'package:yaha/app/views/hikes/personal/screen/settings-screen.dart';
import 'package:yaha/app/views/hikes/personal/widgets/statistics.dart';
import 'package:yaha/app/views/shared/shared.dart';

class AProfileScreen extends StatelessWidget {
  const AProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: YahaSpaceSizes.general, right: YahaSpaceSizes.general),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: YahaBoxSizes.heightSmall,
                width: YahaBoxSizes.widthSmall,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(YahaBorderRadius.general),
                  child: Image.asset(
                    'assets/images/profile-authenticated.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: YahaSpaceSizes.xSmall),
                child: Text(
                  'John Doe',
                  style: TextStyle(
                      fontSize: YahaFontSizes.medium,
                      fontWeight: FontWeight.w600,
                      color: YahaColors.textColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: YahaSpaceSizes.general),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(right: YahaSpaceSizes.xSmall),
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: YahaColors.primary,
                      ),
                    ),
                    const Text(
                      'Taktaharkány',
                      style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w500,
                          color: YahaColors.textColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: YahaBoxSizes.heightXXSmall,
                width: MediaQuery.of(context).size.width,
                child: const Statistics(
                  leftNumber: 24,
                  middleNumber: 8,
                  rightNumber: 16,
                  leftName: 'Patches',
                  middleName: 'TimeCapsules',
                  rightName: 'Memories',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: YahaSpaceSizes.general),
                child: Column(
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
                            Text('Settings',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w400,
                                    color: YahaColors.textColor)),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConnectWallet1Screen(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: YahaSpaceSizes.xSmall,
                            bottom: YahaSpaceSizes.xSmall),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Your wallet',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w400,
                                    color: YahaColors.textColor)),
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
                            Text('Transactions',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w400,
                                    color: YahaColors.textColor)),
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
                            Text('Active bids',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w400,
                                    color: YahaColors.textColor)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
