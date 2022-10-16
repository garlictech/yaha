import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart';
import 'package:fluttermultirestaurant/api/common/ps_status.dart';
import 'package:fluttermultirestaurant/config/ps_colors.dart';
import 'package:fluttermultirestaurant/config/ps_config.dart';
import 'package:fluttermultirestaurant/constant/ps_constants.dart';
import 'package:fluttermultirestaurant/constant/ps_dimens.dart';
import 'package:fluttermultirestaurant/constant/route_paths.dart';
import 'package:fluttermultirestaurant/provider/subcategory/sub_category_provider.dart';
import 'package:fluttermultirestaurant/repository/sub_category_repository.dart';
import 'package:fluttermultirestaurant/ui/common/ps_admob_banner_widget.dart';
import 'package:fluttermultirestaurant/ui/common/ps_ui_widget.dart';
import 'package:fluttermultirestaurant/ui/subcategory/item/sub_category_grid_item.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/category.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_value_holder.dart';
import 'package:fluttermultirestaurant/viewobject/holder/intent_holder/product_list_intent_holder.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SubCategoryGridView extends StatefulWidget {
  const SubCategoryGridView({this.category});
  final Category ?category;
  @override
  _ModelGridViewState createState() {
    return _ModelGridViewState();
  }
}

class _ModelGridViewState extends State<SubCategoryGridView>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  SubCategoryProvider? _subCategoryProvider;
  PsValueHolder? valueHolder;

  AnimationController? animationController;
  Animation<double>? animation;

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
        final String categId = widget.category!.id!;
        Utils.psPrint('CategoryId number is $categId');

        _subCategoryProvider!.nextSubCategoryList(
          widget.category!.id!,
        );
      }
    });
    animationController =
        AnimationController(duration: PsConfig.animation_duration, vsync: this);
    super.initState();
  }

  SubCategoryRepository? repo1;
  bool isConnectedToInternet = false;
  bool isSuccessfullyLoaded = true;
  bool isShowAdmob = true;

  void checkConnection() {
    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
      if (isConnectedToInternet && isShowAdmob) {
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    repo1 = Provider.of<SubCategoryRepository>(context);
    valueHolder = Provider.of<PsValueHolder>(context);

    if (valueHolder!.isShowAdmob != null &&
        valueHolder!.isShowAdmob == PsConst.ONE) {
        isShowAdmob = true;
    } else {
        isShowAdmob = false;
    }
    if (!isConnectedToInternet && isShowAdmob) {
      print('loading ads....');
      checkConnection();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: PsColors.mainColor,
          systemOverlayStyle: SystemUiOverlayStyle (
            statusBarIconBrightness : Utils.getBrightnessForAppBar(context)
          ),
          title: Text(
            widget.category!.name!,
            // style: TextStyle(color: PsColors.white),
          ),
          iconTheme: IconThemeData(
            color: PsColors.white,
          ),
        ),
        body: ChangeNotifierProvider<SubCategoryProvider>(
            lazy: false,
            create: (BuildContext context) {
              _subCategoryProvider =
                  SubCategoryProvider(repo: repo1!, psValueHolder: valueHolder);
              _subCategoryProvider!.loadAllSubCategoryList(
                widget.category!.id!,
              );
              return _subCategoryProvider!;
            },
            child: Consumer<SubCategoryProvider>(builder: (BuildContext context,
                SubCategoryProvider provider, Widget? child) {
              return Column(
                children: <Widget>[
                  const PsAdMobBannerWidget(
                    admobSize: AdSize.banner
                  ),
                  Expanded(
                    child: Stack(children: <Widget>[
                      Container(
                          child: RefreshIndicator(
                        onRefresh: () {
                          return _subCategoryProvider!.resetSubCategoryList(
                            widget.category!.id!,
                          );
                        },
                        child: CustomScrollView(
                            controller: _scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            slivers: <Widget>[
                              SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 240,
                                        childAspectRatio: 1.4),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    if (provider.subCategoryList.status ==
                                        PsStatus.BLOCK_LOADING) {
                                      return Shimmer.fromColors(
                                          baseColor: PsColors.grey,
                                          highlightColor: PsColors.white,
                                          child:
                                              Column(children: const <Widget>[
                                            FrameUIForLoading(),
                                            FrameUIForLoading(),
                                            FrameUIForLoading(),
                                            FrameUIForLoading(),
                                            FrameUIForLoading(),
                                            FrameUIForLoading(),
                                          ]));
                                    } else {
                                      final int count =
                                          provider.subCategoryList.data!.length;
                                      return SubCategoryGridItem(
                                        subCategory: provider
                                            .subCategoryList.data![index],
                                        onTap: () {
                                          provider.subCategoryByCatIdParamenterHolder
                                                  .catId =
                                              provider.subCategoryList
                                                  .data![index].catId;
                                          provider.subCategoryByCatIdParamenterHolder
                                                  .subCatId =
                                              provider.subCategoryList
                                                  .data![index].id;
                                          Navigator.pushNamed(context,
                                              RoutePaths.filterProductList,
                                              arguments: ProductListIntentHolder(
                                                  appBarTitle: provider
                                                      .subCategoryList
                                                      .data![index]
                                                      .name!,
                                                  productParameterHolder: provider
                                                      .subCategoryByCatIdParamenterHolder));
                                        },
                                        animationController:
                                            animationController,
                                        animation:
                                            Tween<double>(begin: 0.0, end: 1.0)
                                                .animate(CurvedAnimation(
                                          parent: animationController!,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn),
                                        )),
                                      );
                                    }
                                  },
                                  childCount:
                                      provider.subCategoryList.data!.length,
                                ),
                              ),
                            ]),
                      )),
                      PSProgressIndicator(
                        provider.subCategoryList.status,
                        message: provider.subCategoryList.message,
                      )
                    ]),
                  )
                ],
              );
            }))
        // )
        );
  }
}

class FrameUIForLoading extends StatelessWidget {
  const FrameUIForLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.all(PsDimens.space16),
            decoration: BoxDecoration(color: PsColors.grey)),
        Expanded(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
              height: 15,
              margin: const EdgeInsets.all(PsDimens.space8),
              decoration: BoxDecoration(color: Colors.grey[300])),
          Container(
              height: 15,
              margin: const EdgeInsets.all(PsDimens.space8),
              decoration: const BoxDecoration(color: Colors.grey)),
        ]))
      ],
    );
  }
}