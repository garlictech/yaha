import 'package:flutter/material.dart';

import '/domain/entities/entities.dart';
import 'yaha-border-radius.dart';
import 'yaha-colors.dart';
import 'yaha-font-sizes.dart';

class LocationTextInfo extends StatelessWidget {
  final Point geoPoint;

  const LocationTextInfo({required this.geoPoint, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(YahaBorderRadius.small)),
        padding: const EdgeInsets.only(top: 5, bottom:  5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: YahaFontSizes.small,
                      color: YahaColors.textColor),
                  children: [
                    const TextSpan(
                      text: 'LAT: ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: '${(geoPoint.latitude * 100000).round() / 100000}',
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: YahaFontSizes.small,
                      color: YahaColors.textColor),
                  children: [
                    const TextSpan(
                      text: 'LON: ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: '${(geoPoint.longitude * 100000).round() / 100000}',
                    ),
                  ],
                ),
              )
            ]),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
                children: [
                  const TextSpan(
                    text: 'HEIGHT: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: '${geoPoint.height.round()} m',
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
