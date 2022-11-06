import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yara/config/ps_colors.dart';
import 'package:yara/constant/ps_dimens.dart';
import 'package:yara/constant/route_paths.dart';
import 'package:yara/provider/basket/basket_provider.dart';
import 'package:yara/repository/basket_repository.dart';
import 'package:yara/ui/search/search_category_view_all/search_category_view_all.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:provider/provider.dart';


class SearchCategoryViewAllContainer extends StatefulWidget {
  const SearchCategoryViewAllContainer({
    @required this.appBarTitle,
    @required this.keyword,
  });
  final String? appBarTitle;
  final String? keyword;

  @override
  State<SearchCategoryViewAllContainer> createState() =>
      _SearchCategoryViewAllContainerState();
}

class _SearchCategoryViewAllContainerState
    extends State<SearchCategoryViewAllContainer> {

  PsValueHolder? psValueHolder;    
  BasketRepository? basketRepository;

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
          widget.appBarTitle!,
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
      body: SearchCategoryViewAll(
        keyword: widget.keyword!,
      ),
    );
  }
}
