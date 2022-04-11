import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yaha/domain/entities/entities.dart';

import '../../shared/shared.dart';

class PoiFilters extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final PoiType poiType;

  const PoiFilters({
    Key? key,
    required this.backgroundColor,
    required this.poiType,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Container(
        //padding: const EdgeInsets.only(left: YahaSpaceSizes.xSmall),
        child: Text(
          title,
          style: const TextStyle(
            color: YahaColors.background,
            fontSize: YahaFontSizes.xSmall,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      avatar: SvgPicture.asset(
          'assets/poi-icons/${poiType.category}/${poiType.kind}.svg',
          color: Colors.white),
      /*padding: const EdgeInsets.only(left: YahaSpaceSizes.xSmall),
      labelPadding: const EdgeInsets.only(
        top: YahaSpaceSizes.xxSmall,
        right: YahaSpaceSizes.medium,
        bottom: YahaSpaceSizes.xxSmall,
      ),*/
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(YahaBorderRadius.xSmall),
      ),
    );
  }
}
