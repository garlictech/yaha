import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:yara/config/ps_colors.dart';
import 'package:yara/constant/ps_constants.dart';
import 'package:yara/constant/ps_dimens.dart';
import 'package:yara/ui/common/ps_ui_widget.dart';
import 'package:yara/ui/common/smooth_star_rating_widget.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/shop.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopHorizontalListItem extends StatelessWidget {
  const ShopHorizontalListItem({
    Key? key,
    required this.shop,
    this.onTap,
  }) : super(key: key);

  final Shop shop;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap as void Function()?,
        child: Card(
          elevation: 0.0,
          color: PsColors.backgroundColor,
          child: Container(
            height: 400,
            width: 300,
            margin: const EdgeInsets.all(PsDimens.space4),
            child: ClipPath(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: PsNetworkImage(
                      photoKey: '',
                      defaultPhoto: shop.defaultPhoto!,
                      width: MediaQuery.of(context).size.width,
                      height: PsDimens.space120,
                      boxfit: BoxFit.cover,
                      onTap: () {
                        Utils.psPrint(shop.defaultPhoto!.imgParentId!);
                        onTap!();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(PsDimens.space12),
                    child: Text(
                      shop.name!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 1,
                    ),
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: PsDimens.space12, right: PsDimens.space12),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '\$',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: shop.priceLevel == PsConst.PRICE_LOW ||
                                      shop.priceLevel == PsConst.PRICE_MEDIUM ||
                                      shop.priceLevel == PsConst.PRICE_HIGH
                                  ? PsColors.priceLevelColor
                                  : PsColors.grey),
                          maxLines: 2,
                        ),
                        Text(
                          '\$',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: shop.priceLevel == PsConst.PRICE_MEDIUM ||
                                      shop.priceLevel == PsConst.PRICE_HIGH
                                  ? PsColors.priceLevelColor
                                  : PsColors.grey),
                          maxLines: 2,
                        ),
                        Text(
                          '\$',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: shop.priceLevel == PsConst.PRICE_HIGH
                                  ? PsColors.priceLevelColor
                                  : PsColors.grey),
                          maxLines: 2,
                        ),
                        const SizedBox(width: PsDimens.space8),
                        Expanded(
                          child: Text(
                            shop.highlightedInfo!,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: PsDimens.space8,
                        top: PsDimens.space8,
                        bottom: PsDimens.space8,
                        right: PsDimens.space8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SmoothStarRating(
                                key: Key(shop.ratingDetail!.totalRatingValue!),
                                rating: double.parse(
                                    shop.ratingDetail!.totalRatingValue!),
                                allowHalfRating: false,
                                onRated: (double? v) {
                                  onTap!();
                                },
                                starCount: 5,
                                size: 20.0,
                                color: PsColors.ratingColor,
                                borderColor: PsColors.grey.withAlpha(100),
                                spacing: 0.0),
                            Text('  ( ${shop.ratingDetail!.totalRatingCount} )',
                                // '${Utils.getString(context, 'feature_slider__rating')}',
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                        Container(
                          child: GestureDetector(
                              child: Icon(FontAwesome5.directions,
                                  size: 32, color: PsColors.mainColor),
                              onTap: () async {
                                print('opening map');

                                if (Platform.isIOS) {
                                  await MapLauncher.showMarker(
                                    mapType: MapType.apple,
                                    coords: Coords(double.parse(shop.lat!),
                                        double.parse(shop.lng!)),
                                    title: 'Shop on Map',
                                  );
                                } else {
                                  await MapLauncher.showMarker(
                                    mapType: MapType.google,
                                    coords: Coords(double.parse(shop.lat!),
                                        double.parse(shop.lng!)),
                                    title: 'Shop on Map',
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
            ),
          ),
        ));
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    final String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    final String encodedURl = Uri.encodeFull(googleUrl);

    if (await canLaunchUrl(Uri.parse(encodedURl))) {
      await launchUrl(Uri.parse(encodedURl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
