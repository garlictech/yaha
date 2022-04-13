import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yaha/domain/entities/entities.dart';

import '../../shared/shared.dart';

class PoiIcon extends StatelessWidget {
  late Color color;
  final PoiType poiType;

  PoiIcon(
      {Key? key, required this.poiType, this.color = const Color(0xff00ff00)})
      : super(key: key) {
    color = PoiIcon._colorMap[poiType.category] ?? const Color(0xff00ff00);
  }

  @override
  Widget build(BuildContext context) {
    SvgPicture svgPicture = SvgPicture.asset(
        'assets/poi-icons/${poiType.kind}.svg',
        color: Colors.white,
        height: 30);

    return Container(
        padding: const EdgeInsets.all(3),
        child: svgPicture,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 4.0, color: color),
        ));
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

  static const _colorMap = {
    "natural": Color(0xff108E4C),
    "amenity": Color(0xff265DB2),
    "public_ransport": Color(0xff9D7050),
    "emergency": Color(0xffBF3638),
    "historic": Color(0xff8D4EB8),
    "leisure": Color(0xffFF8A21),
    "man_made": Color(0xffC259B5),
    "military": Color(0xffA8A8A8),
    "shop": Color(0xff5DC8BD),
    "tourism": Color(0xff66C547),
    "sight": Color(0xff66C547),
    "generic": Color(0xffFF8C00)
  };
}
