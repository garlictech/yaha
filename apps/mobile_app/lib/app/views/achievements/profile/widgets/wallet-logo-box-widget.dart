import 'package:flutter/material.dart';
import 'package:yaha/app/views/shared/shared.dart';

class WalletLogoBox extends StatelessWidget {
  final double width;
  final double height;
  final String logo;

  const WalletLogoBox({
    Key? key,
    required this.width,
    required this.height,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(YahaSpaceSizes.xxSmall),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: YahaColors.accentColor,
        borderRadius: BorderRadius.circular(YahaBorderRadius.xSmall),
      ),
      child: Image.asset(logo),
    );
  }
}
