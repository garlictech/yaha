import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/domain/domain.dart' as domain;

Image getPoiBackgroundImage(domain.PoiType poiType) {
  const poiBackgroundAssetFolder =
      'packages/flutter_yaha_lib/assets/poi-backgrounds';

  final poiBackgroundImage = "$poiBackgroundAssetFolder/${poiType.kind}.png";

  const defaultImagePath =
      '$poiBackgroundAssetFolder/default_poi_background.jpg';

  return Image.asset(poiBackgroundImage,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
          Image.asset(defaultImagePath, fit: BoxFit.cover));
}
