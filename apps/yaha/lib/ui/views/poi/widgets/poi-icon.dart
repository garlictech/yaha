import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yaha/domain/entities/entities.dart';

import '../../shared/shared.dart';

class PoiIcon extends StatelessWidget {
  final PoiType poiType;

  const PoiIcon({
    Key? key,
    required this.poiType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        PoiIcon._colorMap[poiType.category] ?? const Color(0xff00ff00);

    SvgPicture svgPicture = SvgPicture.asset(
        'assets/poi-icons/${poiType.kind}.svg',
        color: Colors.white);

    return Container(
        //padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(width: YahaBorderRadius.xSmall, color: color)),
        //padding: const EdgeInsets.all(3),
        child: svgPicture);
  }

  static final _colorMap = {
    "natural": const Color(0xff108E4C),
    "amenity": const Color(0xff265DB2),
    "public_ransport": const Color(0xff9D7050),
    "emergency": const Color(0xffBF3638),
    "historic": const Color(0xff8D4EB8),
    "leisure": const Color(0xffFF8A21),
    "man_made": const Color(0xffC259B5),
    "military": const Color(0xffA8A8A8),
    "shop": const Color(0xff5DC8BD),
    "tourism": const Color(0xff66C547),
    "sight": const Color(0xff66C547),
    "generic": const Color(0xffFF8C00),
    "yaha": Colors.red.shade300,
    "weather": Colors.orange.shade300
  };
}
