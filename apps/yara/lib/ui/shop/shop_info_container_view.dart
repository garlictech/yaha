import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttermultirestaurant/config/ps_colors.dart';
import 'package:fluttermultirestaurant/config/ps_config.dart';
import 'package:fluttermultirestaurant/constant/ps_dimens.dart';
import 'package:fluttermultirestaurant/constant/route_paths.dart';
import 'package:fluttermultirestaurant/provider/rating/shop_rating_provider.dart';
import 'package:fluttermultirestaurant/provider/shop_info/shop_info_provider.dart';
import 'package:fluttermultirestaurant/repository/shop_info_repository.dart';
import 'package:fluttermultirestaurant/repository/shop_rating_repository.dart';
import 'package:fluttermultirestaurant/ui/common/base/ps_widget_with_multi_provider.dart';
import 'package:fluttermultirestaurant/ui/common/ps_admob_banner_widget.dart';
import 'package:fluttermultirestaurant/ui/common/ps_back_button_with_circle_bg_widget.dart';
import 'package:fluttermultirestaurant/ui/common/ps_ui_widget.dart';
import 'package:fluttermultirestaurant/ui/shop/shop_info_view.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_value_holder.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ShopInfoContainerView extends StatefulWidget {
  const ShopInfoContainerView({required this.shopId});
  final String shopId;
  @override
  _CityShopInfoContainerViewState createState() =>
      _CityShopInfoContainerViewState();
}

class _CityShopInfoContainerViewState extends State<ShopInfoContainerView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: PsConfig.animation_duration, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ShopRatingRepository? shopRatingRepo;
  ShopRatingProvider? shopRatingProvider;
  ShopInfoProvider? shopInfoProvider;
  ShopInfoRepository? shopInfoRepository;
  PsValueHolder? valueHolder;
  @override
  Widget build(BuildContext context) {
    shopRatingRepo = Provider.of<ShopRatingRepository>(context);
    shopInfoRepository = Provider.of<ShopInfoRepository>(context);
    valueHolder = Provider.of<PsValueHolder>(context);
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

    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: animationController!,
            curve: const Interval(0.5 * 1, 1.0, curve: Curves.fastOutSlowIn)));

    print(
        '............................Build UI Again ............................');

    return WillPopScope(
        onWillPop: _requestPop,
        child: PsWidgetWithMultiProvider(
          child: MultiProvider(
              providers: <SingleChildWidget>[
                ChangeNotifierProvider<ShopRatingProvider>(
                  lazy: false,
                  create: (BuildContext context) {
                    shopRatingProvider =
                        ShopRatingProvider(repo: shopRatingRepo!);

                    shopRatingProvider!.loadShopRatingList(widget.shopId);

                    return shopRatingProvider!;
                  },
                ),
                ChangeNotifierProvider<ShopInfoProvider>(
                  lazy: false,
                  create: (BuildContext context) {
                    shopInfoProvider = ShopInfoProvider(
                        ownerCode: 'ShopInfoContainerView',
                        psValueHolder: valueHolder!,
                        repo: shopInfoRepository!);
                    shopInfoProvider!.loadShopInfo(widget.shopId);
                    return shopInfoProvider!;
                  },
                ),
              ],
              child: Consumer<ShopRatingProvider>(builder:
                  (BuildContext context, ShopRatingProvider shopRatingProvider,
                      Widget? child) {
                return Consumer<ShopInfoProvider>(
                  builder: (BuildContext context,
                      ShopInfoProvider shopInfoProvider, Widget? child) {
                    if (
                        shopRatingProvider.ratingList.data != null &&
                        
                        shopInfoProvider.shopInfo.data != null) {
                      return Container(
                        color: PsColors.coreBackgroundColor,
                        child: CustomScrollView(
                          slivers: <Widget>[
                            const SliverToBoxAdapter(
                              child: PsAdMobBannerWidget(
                                admobSize: AdSize.banner
                              ),
                            ),
                            SliverAppBar(
                              automaticallyImplyLeading: true,
                              systemOverlayStyle: SystemUiOverlayStyle (
                                statusBarIconBrightness : Utils.getBrightnessForAppBar(context)
                              ),
                              expandedHeight: PsDimens.space300,
                              iconTheme: Theme.of(context)
                                  .iconTheme
                                  .copyWith(color: PsColors.mainColorWithWhite),
                              leading: const PsBackButtonWithCircleBgWidget(
                                  isReadyToShow: true),
                              floating: false,
                              pinned: false,
                              stretch: true,
                              backgroundColor: PsColors.mainColorWithBlack,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Container(
                                  color: PsColors.backgroundColor,
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: <Widget>[
                                      PsNetworkImage(
                                        photoKey: shopInfoProvider
                                            .shopInfo.data!.defaultPhoto!.imgPath!,
                                        defaultPhoto: shopInfoProvider
                                            .shopInfo.data!.defaultPhoto!,
                                        width: MediaQuery.of(context).size.width,
                                        height: PsDimens.space330,
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              RoutePaths.shopGalleryGrid,
                                              arguments: shopInfoProvider
                                                  .shopInfo.data);
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: PsDimens.space12,
                                              right: PsDimens.space12,
                                              bottom: PsDimens.space12),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      PsDimens.space4),
                                              color: Colors.black45),
                                          padding: const EdgeInsets.all(
                                              PsDimens.space12),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Icon(
                                                FontAwesome5.image,
                                                color: PsColors.white,
                                              ),
                                              const SizedBox(
                                                  width: PsDimens.space12),
                                              Text(
                                                Utils.getString(context,
                                                    'shop_info__more_images'),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        color: PsColors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              RoutePaths.shopGalleryGrid,
                                              arguments: shopInfoProvider
                                                  .shopInfo.data);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ShopInfoView(
                              shopId: widget.shopId,
                              shopInfoProvider: shopInfoProvider,
                              shopRatingProvider: shopRatingProvider,
                              animationController: animationController!,
                              animation: animation,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              })),
        ));
  }
}
