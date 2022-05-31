import 'package:flutter/material.dart';
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
          child: Column(),
        ),
      ),
    );
  }
}
