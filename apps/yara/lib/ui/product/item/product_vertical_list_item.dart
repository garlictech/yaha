import 'package:flutter/material.dart';
import 'package:fluttermultirestaurant/config/ps_colors.dart';
import 'package:fluttermultirestaurant/constant/ps_constants.dart';
import 'package:fluttermultirestaurant/constant/ps_dimens.dart';
import 'package:fluttermultirestaurant/ui/common/ps_hero.dart';
import 'package:fluttermultirestaurant/ui/common/ps_ui_widget.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_value_holder.dart';
import 'package:fluttermultirestaurant/viewobject/product.dart';
import 'package:provider/provider.dart';

class ProductVeticalListItem extends StatelessWidget {
  const ProductVeticalListItem(
      {Key? key,
      required this.product,
      this.onTap,
      this.onButtonTap,
      this.animationController,
      this.animation,
      this.coreTagKey})
      : super(key: key);

  final Product product;
  final Function? onTap;
  final Function? onButtonTap;
  final String? coreTagKey;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    final PsValueHolder valueHolder =
        Provider.of<PsValueHolder>(context, listen: false);
    animationController!.forward();
    return AnimatedBuilder(
        animation: animationController!,
        child: GestureDetector(
            onTap: onTap as void Function()?,
            child: GridTile(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: PsDimens.space8, vertical: PsDimens.space8),
                decoration: BoxDecoration(
                  color: PsColors.backgroundColor,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(PsDimens.space8)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(PsDimens.space8)),
                        ),
                        child: ClipPath(
                          child: PsNetworkImage(
                            photoKey: '$coreTagKey${PsConst.HERO_TAG__IMAGE}',
                            defaultPhoto: product.defaultPhoto!,
                            width: PsDimens.space180,
                            height: PsDimens.space160,
                            boxfit: BoxFit.cover,
                            onTap: () {
                              Utils.psPrint(product.defaultPhoto!.imgParentId!);
                              onTap!();
                            },
                          ),
                          clipper: const ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(PsDimens.space8),
                                      topRight:
                                          Radius.circular(PsDimens.space8)))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: PsDimens.space8,
                          top: PsDimens.space4,
                          right: PsDimens.space8),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: PsHero(
                            tag: '$coreTagKey$PsConst.HERO_TAG__UNIT_PRICE',
                            flightShuttleBuilder: Utils.flightShuttleBuilder,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                  '${product.currencySymbol}${Utils.getPriceFormat(product.unitPrice!, valueHolder)}',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        color: PsColors.mainColor,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1),
                            ),
                          )),
                          if (product.isDiscount == PsConst.ONE)
                            Text(
                              '  ${product.discountPercent}% ' +
                                  Utils.getString(
                                      context, 'product_detail__discount_off'),
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: PsColors.discountColor),
                            )
                          else
                            Container()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: PsDimens.space8,
                          top: PsDimens.space8,
                          right: PsDimens.space8,
                          bottom: PsDimens.space12),
                      child: PsHero(
                        tag: '$coreTagKey${PsConst.HERO_TAG__TITLE}',
                        child: Text(
                          product.name!,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Container(
                        child: Row(children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: PsDimens.space8,
                              top: PsDimens.space8,
                              right: PsDimens.space8,
                              bottom: PsDimens.space12),
                          child: PsHero(
                            tag:
                                '$coreTagKey${PsConst.HERO_TAG__ORIGINAL_PRICE}',
                            child: Text(
                              product.shop!.name!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: PsColors.mainColor),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(bottom: PsDimens.space4),
                          child: IconButton(
                              iconSize: PsDimens.space32,
                              icon: Icon(Icons.add_circle,
                                  color: PsColors.mainColor),
                              onPressed: () {
                                onButtonTap!();
                              })),
                    ])),
                  ],
                ),
              ),
            )),
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: animation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 100 * (1.0 - animation!.value), 0.0),
                child: child,
              ));
        });
  }
}
