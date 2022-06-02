import 'package:flutter/material.dart';
import 'package:yaha/app/views/shared/shared.dart';

class WalletLogoBox extends StatelessWidget {
  final double width;
  final double height;
  final String logo;
  final double padding;
  final double borderRadius;

  const WalletLogoBox({
    Key? key,
    required this.width,
    required this.height,
    required this.logo,
    required this.padding,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: YahaColors.accentColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Image.asset(logo),
    );
  }
}
