import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class PoiWithImageWidget extends StatelessWidget {
  final Color backgroundColor;
  final String image;

  const PoiWithImageWidget({
    Key? key,
    required this.backgroundColor,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(YahaBorderRadius.poiLarge),
      child: Container(
        padding: EdgeInsets.all(YahaSpaceSizes.xSmall),
        color: backgroundColor,
        child: Container(
          child: Image.asset(
            image,
            width: 32,
          ),
        ),
      ),
    );
  }
}
