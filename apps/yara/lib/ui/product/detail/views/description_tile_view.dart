import 'package:flutter/material.dart';
import 'package:fluttermultirestaurant/constant/ps_dimens.dart';
import 'package:fluttermultirestaurant/ui/common/ps_expansion_tile.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/product.dart';

class DescriptionTileView extends StatelessWidget {
  const DescriptionTileView({
    Key? key,
    required this.productDetail,
  }) : super(key: key);

  final Product productDetail;
  @override
  Widget build(BuildContext context) {
    final Widget _expansionTileTitleWidget = Text(
        Utils.getString(context, 'description_tile__product_description'),
        style: Theme.of(context).textTheme.subtitle1);
    if (productDetail.description != null) {
      return Container(
        child: PsExpansionTile(
          initiallyExpanded: true,
          title: _expansionTileTitleWidget,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  bottom: PsDimens.space16,
                  left: PsDimens.space16,
                  right: PsDimens.space16),
              child: Text(
                productDetail.description ?? '',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      height: 1.3,
                      letterSpacing: 0.5,
                    ),
              ),
            )
          ],
        ),
      );
    } else {
      return const Card();
    }
  }
}
