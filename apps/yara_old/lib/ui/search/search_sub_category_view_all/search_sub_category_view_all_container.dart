import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yara/ui/search/search_sub_category_view_all/search_sub_category_view_all.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:provider/provider.dart';
import '../../../config/ps_colors.dart';
import '../../../constant/ps_dimens.dart';
import '../../../constant/route_paths.dart';
import '../../../provider/basket/basket_provider.dart';
import '../../../repository/basket_repository.dart';
import '../../../utils/utils.dart';

class SearchSubCategoryViewAllContainer extends StatefulWidget {
  const SearchSubCategoryViewAllContainer({
    required this.appBarTitle,
    required this.keyword,
  });
  final String appBarTitle;
  final String keyword;
  @override
  _SearchSubCategoryViewAllContainerState createState() =>
      _SearchSubCategoryViewAllContainerState();
}

class _SearchSubCategoryViewAllContainerState
    extends State<SearchSubCategoryViewAllContainer> {
  PsValueHolder? psValueHolder;
  BasketRepository? basketRepository;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    psValueHolder = Provider.of<PsValueHolder>(context);
    basketRepository = Provider.of<BasketRepository>(context);

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Utils.getBrightnessForAppBar(context)),
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: PsColors.mainColorWithWhite),
        title: Text(
          widget.appBarTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold, color: PsColors.mainColorWithWhite),
        ),
        elevation: 0,
        actions: <Widget>[
          ChangeNotifierProvider<BasketProvider>(
            lazy: false,
            create: (BuildContext context) {
              final BasketProvider provider =
                  BasketProvider(
                    repo: basketRepository,
                    psValueHolder: psValueHolder);
              provider.loadBasketList();
              return provider;
            },
            child: Consumer<BasketProvider>(builder: (BuildContext context,
                BasketProvider basketProvider, Widget? child) {
              return InkWell(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: PsDimens.space40,
                        height: PsDimens.space40,
                        margin: const EdgeInsets.only(
                            top: PsDimens.space8,
                            left: PsDimens.space8,
                            right: PsDimens.space8),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.shopping_basket,
                            color: PsColors.mainColor,
                          ),
                        ),
                      ),
                      if (basketProvider.basketList.data!.isNotEmpty)
                        Positioned(
                          right: PsDimens.space4,
                          top: PsDimens.space1,
                          child: Container(
                            width: PsDimens.space28,
                            height: PsDimens.space28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: PsColors.black.withAlpha(200),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                basketProvider.basketList.data!.length > 99
                                    ? '99+'
                                    : basketProvider.basketList.data!.length
                                        .toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: PsColors.white),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.basketList,
                    );
                  });
            }),
          )
        ],
      ),
      body: SearchSubCategoryViewAll(
        keyword: widget.keyword,
      ),
    );
  }
}
