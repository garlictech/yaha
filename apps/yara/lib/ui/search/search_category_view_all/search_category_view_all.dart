import 'package:flutter/material.dart';
import 'package:fluttermultirestaurant/config/ps_config.dart';
import 'package:fluttermultirestaurant/constant/ps_constants.dart';
import 'package:fluttermultirestaurant/constant/ps_dimens.dart';
import 'package:fluttermultirestaurant/constant/route_paths.dart';
import 'package:fluttermultirestaurant/provider/category/search_category_provider.dart';
import 'package:fluttermultirestaurant/repository/category_repository.dart';
import 'package:fluttermultirestaurant/ui/category/item/category_vertical_list_item.dart';
import 'package:fluttermultirestaurant/ui/common/ps_admob_banner_widget.dart';
import 'package:fluttermultirestaurant/ui/common/ps_ui_widget.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_value_holder.dart';
import 'package:fluttermultirestaurant/viewobject/holder/category_parameter_holder.dart';
import 'package:fluttermultirestaurant/viewobject/holder/intent_holder/product_list_intent_holder.dart';
import 'package:fluttermultirestaurant/viewobject/holder/product_parameter_holder.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class SearchCategoryViewAll extends StatefulWidget {
  const SearchCategoryViewAll({@required this.keyword});
  final String? keyword;
  @override
  _SearchCategoryViewAllState createState() => _SearchCategoryViewAllState();
}

class _SearchCategoryViewAllState extends State<SearchCategoryViewAll>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  AnimationController? animationController;
  Animation<double>? animation;
  CategoryRepository? categoryRepository;
  PsValueHolder? psValueHolder;
  SearchCategoryProvider? provider;
  CategoryParameterHolder? holder;
  bool isShowSubCategory = false;
  bool isShowAdmob = true;

  @override
  void dispose() {
    animationController!.dispose();
    animation = null;
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        provider!.loadNextCatgoryListByKey(holder!);
      }
    });

    animationController =
        AnimationController(duration: PsConfig.animation_duration, vsync: this);

    super.initState();
  }

  bool isConnectedToInternet = false;
  void checkConnection() {
    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
      if (isConnectedToInternet && isShowAdmob) {
        setState(() {});
      }
    });
  }

  Future<bool> _requestPop() {
    animationController!.reverse().then<dynamic>(
      (void data) {
        if (!mounted) {
          return Future<bool>.value(false);
        }
        Navigator.pop(context, true);
        return Future<bool>.value(true);
      },
    );
    return Future<bool>.value(false);
  }

  @override
  Widget build(BuildContext context) {
    categoryRepository = Provider.of<CategoryRepository>(context);
    psValueHolder = Provider.of<PsValueHolder>(context);

    if (psValueHolder!.isShowAdmob != null &&
        psValueHolder!.isShowAdmob == PsConst.ONE) {
        isShowAdmob = true;
    } else {
        isShowAdmob = false;
    }
    if (!isConnectedToInternet && isShowAdmob) {
      print('loading ads....');
      checkConnection();
    }
    if (psValueHolder!.isShowSubCategory != null &&
        psValueHolder!.isShowSubCategory == PsConst.ONE) {
        isShowSubCategory = true;
    } else {
        isShowSubCategory = false;
    }

    return WillPopScope(
        onWillPop: _requestPop,
        child: ChangeNotifierProvider<SearchCategoryProvider>(
            lazy: false,
            create: (BuildContext context) {
              provider = SearchCategoryProvider(
                repo: categoryRepository!,
                psValueHolder: psValueHolder!,
              );
              holder = CategoryParameterHolder();
              holder!.searchTerm = widget.keyword;
              provider!.loadCatgoryListByKey(holder!);
              return provider!;
            },
            child: Consumer<SearchCategoryProvider>(builder:
                (_, SearchCategoryProvider searchCategoryProvider, __) {
              if (searchCategoryProvider.categoryList.data != null) {
                return Stack(children: <Widget>[
                  Column(children: <Widget>[
                    const PsAdMobBannerWidget(admobSize: AdSize.banner),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: PsDimens.space8,
                              right: PsDimens.space8,
                              top: PsDimens.space8,
                              bottom: PsDimens.space8),
                          child: RefreshIndicator(
                            child: CustomScrollView(
                                controller: _scrollController,
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                slivers: <Widget>[
                                  SliverGrid(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 200.0,
                                            childAspectRatio: 0.8),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        if (searchCategoryProvider
                                                    .categoryList.data !=
                                                null ||
                                            // ignore: unnecessary_null_comparison
                                            searchCategoryProvider.categoryList != null) {
                                          final int count =
                                              searchCategoryProvider
                                                  .categoryList.data!.length;
                                          return CategoryVerticalListItem(
                                            animationController:
                                                animationController,
                                            animation: Tween<double>(
                                                    begin: 0.0, end: 1.0)
                                                .animate(
                                              CurvedAnimation(
                                                parent: animationController!,
                                                curve: Interval(
                                                    (1 / count) * index, 1.0,
                                                    curve:
                                                        Curves.fastOutSlowIn),
                                              ),
                                            ),
                                            category: searchCategoryProvider
                                                .categoryList.data![index],
                                            onTap: () {
                                              if (isShowSubCategory) {
                                                Navigator.pushNamed(context,
                                                    RoutePaths.subCategoryGrid,
                                                    arguments:
                                                        searchCategoryProvider
                                                            .categoryList
                                                            .data![index]);
                                              } else {                                        
                                                final ProductParameterHolder
                                                    productParameterHolder =
                                                    ProductParameterHolder()
                                                        .getLatestParameterHolder();
                                                productParameterHolder.catId =
                                                    searchCategoryProvider
                                                        .categoryList
                                                        .data![index]
                                                        .id;
                                                Navigator.pushNamed(
                                                    context,
                                                    RoutePaths
                                                        .filterProductList,
                                                    arguments:
                                                        ProductListIntentHolder(
                                                      appBarTitle:
                                                          searchCategoryProvider
                                                              .categoryList
                                                              .data![index]
                                                              .name!,
                                                      productParameterHolder:
                                                          productParameterHolder,
                                                    ));
                                              }
                                            },
                                          );
                                        } else {
                                          return null;
                                        }
                                      },
                                      childCount: searchCategoryProvider
                                          .categoryList.data!.length,
                                    ),
                                  ),
                                ]),
                            onRefresh: () {
                              return provider!.loadCatgoryListByKey(holder!);
                            },
                          )),
                    ),
                  ]),
                  PSProgressIndicator(
                      searchCategoryProvider.categoryList.status)
                ]);
              } else {
                return Container();
              }
            })));
  }
}
