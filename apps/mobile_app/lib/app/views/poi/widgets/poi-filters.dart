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
    SvgPicture svgPicture = SvgPicture.asset(
        'assets/poi-icons/${poiType.kind}.svg',
        color: backgroundColor,
        height: 30);
    return svgPicture;
    /*return Chip(
      label: Text(
        title,
        style: const TextStyle(
          color: YahaColors.background,
          fontSize: YahaFontSizes.xSmall,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: backgroundColor,
      avatar: svgPicture,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(YahaBorderRadius.xSmall),
      ),
    );*/
  }
}
