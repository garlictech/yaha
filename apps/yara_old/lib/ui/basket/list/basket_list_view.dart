import 'package:flutter/material.dart';
import 'package:yara/config/ps_colors.dart';
import 'package:yara/constant/ps_constants.dart';
import 'package:yara/constant/ps_dimens.dart';
import 'package:yara/constant/route_paths.dart';
import 'package:yara/provider/basket/basket_provider.dart';
import 'package:yara/provider/shop_info/shop_info_provider.dart';
import 'package:yara/repository/basket_repository.dart';
import 'package:yara/repository/shop_info_repository.dart';
import 'package:yara/ui/common/dialog/confirm_dialog_view.dart';
import 'package:yara/ui/common/dialog/error_dialog.dart';
import 'package:yara/ui/common/ps_admob_banner_widget.dart';
import 'package:yara/ui/common/ps_ui_widget.dart';
import 'package:yara/utils/ps_progress_dialog.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/basket.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/checkout_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/product_detail_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/shop_data_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/whatsApp_checkout_intent_holder.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../item/basket_list_item.dart';

class BasketListView extends StatefulWidget {
  const BasketListView({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  final AnimationController? animationController;
  @override
  _BasketListViewState createState() => _BasketListViewState();
}

class _BasketListViewState extends State<BasketListView>
    with SingleTickerProviderStateMixin {
  late BasketRepository basketRepo;
  PsValueHolder? valueHolder;
  dynamic data;
  ShopInfoProvider? shopInfoProvider;
  late ShopInfoRepository shopInfoRepository;
  bool isConnectedToInternet = false;
  bool isSuccessfullyLoaded = true;
  bool isShowAdmob = true;

  void checkConnection() {
    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
      if (isConnectedToInternet && isShowAdmob) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   
    valueHolder = Provider.of<PsValueHolder>(context);
    basketRepo = Provider.of<BasketRepository>(context);
    shopInfoRepository = Provider.of<ShopInfoRepository>(context);

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

    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<BasketProvider>(
            lazy: false,
            create: (BuildContext context) {
              final BasketProvider provider = BasketProvider(repo: basketRepo);
              provider.loadBasketList();

              return provider;
            }),
        ChangeNotifierProvider<ShopInfoProvider>(
          lazy: false,
          create: (BuildContext context) {
            shopInfoProvider = ShopInfoProvider(
                ownerCode: '',
                psValueHolder: valueHolder!,
                repo: shopInfoRepository);
              //  shopInfoProvider!.loadShopInfo(valueHolder!.shopId!);
            return shopInfoProvider!;
          },
        ),
      ],
      child: Consumer<BasketProvider>(builder:
          (BuildContext context, BasketProvider provider, Widget? child) {
        if ( provider.basketList.data != null) {
          if (provider.basketList.data!.isNotEmpty) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const PsAdMobBannerWidget(
                  admobSize: AdSize.banner
                ),
                 _ShopInfoViewWidget(
                    basket: provider.basketList.data![0],
                  ),
                Expanded(
                  child: Container(
                      child: RefreshIndicator(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: provider.basketList.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final int count = provider.basketList.data!.length;
                        widget.animationController!.forward();
                        return BasketListItemView(
                            animationController: widget.animationController!,
                            animation:
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: widget.animationController!,
                                curve: Interval((1 / count) * index, 1.0,
                                    curve: Curves.fastOutSlowIn),
                              ),
                            ),
                            basket: provider.basketList.data![index],
                            onTap: () async {
                              // final Basket intentBasket = provider.basketList.data[index];
                              final dynamic returnData =
                                  await Navigator.pushNamed(
                                      context, RoutePaths.productDetail,
                                      arguments: ProductDetailIntentHolder(
                                        id: provider.basketList.data![index].id,
                                        qty:
                                            provider.basketList.data![index].qty,
                                        selectedColorId: provider.basketList
                                            .data![index].selectedColorId,
                                        selectedColorValue: provider.basketList
                                            .data![index].selectedColorValue,
                                        basketPrice: provider
                                            .basketList.data![index].basketPrice,
                                        basketSelectedAttributeList: provider
                                            .basketList
                                            .data![index]
                                            .basketSelectedAttributeList,
                                        basketSelectedAddOnList: provider
                                            .basketList
                                            .data![index]
                                            .basketSelectedAddOnList,
                                        productId: provider
                                            .basketList.data![index].product!.id,
                                        heroTagImage: '',
                                        heroTagTitle: '',
                                        heroTagOriginalPrice: '',
                                        heroTagUnitPrice: '',
                                      ));
                              if (returnData == null) {
                                provider.resetBasketList();
                              }
                            },
                            onDeleteTap: () {
                              showDialog<dynamic>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ConfirmDialogView(
                                        description: Utils.getString(context,
                                            'basket_list__confirm_dialog_description'),
                                        leftButtonText: Utils.getString(context,
                                            'basket_list__comfirm_dialog_cancel_button'),
                                        rightButtonText: Utils.getString(
                                            context,
                                            'basket_list__comfirm_dialog_ok_button'),
                                        onAgreeTap: () async {
                                          Navigator.of(context).pop();
                                          provider.deleteBasketByProduct(
                                              provider.basketList.data![index]);
                                        });
                                  });
                            });
                      },
                    ),
                    onRefresh: () {
                      return provider.resetBasketList();
                    },
                  )),
                ),
                _CheckoutButtonWidget(
                  provider: provider,
                  shopInfoProvider: shopInfoProvider!,
                ),
              ],
            );
          } else {
            widget.animationController!.forward();
            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: widget.animationController!,
                    curve: const Interval(0.5 * 1, 1.0,
                        curve: Curves.fastOutSlowIn)));
            return AnimatedBuilder(
              animation: widget.animationController!,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(bottom: PsDimens.space120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/empty_basket.png',
                        height: 150,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: PsDimens.space32,
                      ),
                      Text(
                        Utils.getString(
                            context, 'basket_list__empty_cart_title'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(),
                      ),
                      const SizedBox(
                        height: PsDimens.space8,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            PsDimens.space32, 0, PsDimens.space32, 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              Utils.getString(context,
                                  'basket_list__empty_cart_description'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
                    opacity: animation,
                    child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, 100 * (1.0 - animation.value), 0.0),
                      child: child,
                    ));
              },
            );
          }
        } else {
          return Container();
        }
      }),
    );
  }
}

class _CheckoutButtonWidget extends StatelessWidget {
  const _CheckoutButtonWidget({
    Key? key,
    required this.provider,
    required this.shopInfoProvider,
  }) : super(key: key);

  final BasketProvider provider;
  final ShopInfoProvider? shopInfoProvider;
  @override
  Widget build(BuildContext context) {
    final PsValueHolder psValueHolder = 
        Provider.of<PsValueHolder>(context);
    double totalPrice = 0.0;
    int qty = 0;
    String? currencySymbol;

    for (Basket basket in provider.basketList.data!) {
      totalPrice += double.parse(basket.basketPrice!) * double.parse(basket.qty!);

      qty += int.parse(basket.qty!);
      currencySymbol = basket.product!.currencySymbol!;
    }

    return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(PsDimens.space8),
        decoration: BoxDecoration(
          color: PsColors.backgroundColor,
          border: Border.all(color: PsColors.mainLightShadowColor),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(PsDimens.space12),
              topRight: Radius.circular(PsDimens.space12)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: PsColors.mainShadowColor,
                offset: const Offset(1.1, 1.1),
                blurRadius: 7.0),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: PsDimens.space8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  '${Utils.getString(context, 'checkout__price')} $currencySymbol ${Utils.getPriceFormat(totalPrice.toString(), psValueHolder)}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  '$qty  ${Utils.getString(context, 'checkout__items')}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            const SizedBox(height: PsDimens.space8),
            Card(
              elevation: 0,
              color: PsColors.mainColor,
              shape: const BeveledRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(PsDimens.space8))),
              child: InkWell(
                onTap: () async {
                  // Basket Item Count Check
                  // Need to have at least 1 item in basket
                  if (await Utils.checkInternetConnectivity()) {
                    if (
                        provider.basketList.data!.isEmpty) {
                      // Show Error Dialog
                      showDialog<dynamic>(
                          context: context,
                          builder: (BuildContext context) {
                            return ErrorDialog(
                              message: Utils.getString(
                                  context, 'basket_list__empty_cart_title'),
                            );
                          });
                    }

                    // Get Currency Symbol
                    final String currencySymbol =
                        provider.basketList.data![0].product!.currencySymbol!;

                    // Try to get Minmium Order Amount
                    // If there is no error, allow to call next page.

                    final String shopId =
                        provider.basketList.data![0].product!.shop!.id!;

                    await PsProgressDialog.showDialog(context);

                    await shopInfoProvider!.loadShopInfo(shopId);

                    PsProgressDialog.dismissDialog();

                    if (shopInfoProvider!.shopInfo.data != null) {
                      double minOrderAmount = 0;
                      try {
                        minOrderAmount = double.parse(
                            shopInfoProvider!.shopInfo.data!.minimumOrderAmount!);
                      } catch (e) {
                        minOrderAmount = 0;
                      }

                      print(shopInfoProvider!.shopInfo.data!.minimumOrderAmount);

                      if (totalPrice >= minOrderAmount || minOrderAmount == 0) {
                        Utils.navigateOnUserVerificationView(context, () async {
                          if(shopInfoProvider!.shopInfo.data!.checkoutWithWhatsApp == PsConst.ONE) {
                            await Navigator.pushNamed(
                              context, RoutePaths.whatsAppCheckout_container,
                              arguments: WhatsAppCheckoutIntentHolder(
                                  basketList: provider.basketList.data));
                          } else if(shopInfoProvider!.shopInfo.data!.onePageCheckout == PsConst.ONE) {                          
                            await Navigator.pushNamed(
                              context, RoutePaths.onepage_checkout_container,
                              arguments: CheckoutIntentHolder(
                                  basketList: provider.basketList.data,
                                  shopInfoProvider: shopInfoProvider,
                                  ));
                          } else {
                            await Navigator.pushNamed(
                              context, RoutePaths.checkout_container,
                              arguments: CheckoutIntentHolder(
                                  basketList: provider.basketList.data!));
                        }});
                      } else {
                        showDialog<dynamic>(
                            context: context,
                            builder: (BuildContext context) {
                              return ErrorDialog(
                                message: Utils.getString(context,
                                        'basket_list__error_minimum_order_amount') +
                                    '$currencySymbol'
                                        '${shopInfoProvider!.shopInfo.data!.minimumOrderAmount}',
                              );
                            });
                      }
                    }
                  } else {
                    showDialog<dynamic>(
                        context: context,
                        builder: (BuildContext context) {
                          return ErrorDialog(
                            message: Utils.getString(
                                context, 'error_dialog__no_internet'),
                          );
                        });
                  }
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    padding: const EdgeInsets.only(
                        left: PsDimens.space4, right: PsDimens.space4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        PsColors.mainColor,
                        PsColors.mainDarkColor,
                      ]),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(PsDimens.space12)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: PsColors.mainColorWithBlack.withOpacity(0.6),
                            offset: const Offset(0, 4),
                            blurRadius: 8.0,
                            spreadRadius: 3.0),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.payment, color: PsColors.white),
                        const SizedBox(
                          width: PsDimens.space8,
                        ),
                        Text(
                          Utils.getString(
                              context, 'basket_list__checkout_button_name'),
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: PsColors.white),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(height: PsDimens.space8),
          ],
        ));
  }
}

class _ShopInfoViewWidget extends StatefulWidget {
  const _ShopInfoViewWidget({
    Key? key,
    required this.basket,
  }) : super(key: key);

  final Basket  basket;

  @override
  __ShopInfoViewWidgetState createState() => __ShopInfoViewWidgetState();
}

class __ShopInfoViewWidgetState extends State<_ShopInfoViewWidget> {
  bool isConnectedToInternet = false;
  bool isSuccessfullyLoaded = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, RoutePaths.shop_dashboard,
          arguments: ShopDataIntentHolder(
              shopId: widget.basket
                  .product!.shop!.id!,
              shopName: widget.basket
                  .product!.shop!.name!));
      },
    child: Container(
      color: PsColors.baseColor,
      child: Column(
        children: <Widget>[
          _HeaderBoxWidget(
            basket: widget.basket
          ),
          ],
        ),
      )
    );
  }
}

class _HeaderBoxWidget extends StatefulWidget {
  const _HeaderBoxWidget({
    Key? key,
    required this.basket,
  }) : super(key: key);

  final Basket  basket;

  @override
  __HeaderBoxWidgetState createState() => __HeaderBoxWidgetState();
}

class __HeaderBoxWidgetState extends State<_HeaderBoxWidget> {
  @override
  Widget build(BuildContext context) {
   
    if ( widget.basket.product!.shop != null) {
      return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: PsDimens.space8,
                  bottom: PsDimens.space8,
                  left: PsDimens.space8),
              child: Container(
                width: PsDimens.space60,
                height: PsDimens.space60,
                child: PsNetworkImage(
                  photoKey: '',
                  defaultPhoto: widget.basket
                      .product!.shop!.defaultPhoto!,
                  boxfit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: PsDimens.space8,
            ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(PsDimens.space16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                         widget.basket.product!.shop!.name!,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: PsDimens.space8),
                        Row(
                          children: <Widget>[
                            Text(
                              '\$',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: widget.basket.product!.shop!.priceLevel ==
                                              PsConst.PRICE_LOW ||
                                          widget.basket.product!.shop!.priceLevel ==
                                              PsConst.PRICE_MEDIUM ||
                                          widget.basket.product!.shop!.priceLevel ==
                                              PsConst.PRICE_HIGH
                                      ? PsColors.priceLevelColor
                                      : PsColors.grey),
                              maxLines: 2,
                            ),
                            Text(
                              '\$',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: widget.basket.product!.shop!.priceLevel ==
                                              PsConst.PRICE_MEDIUM ||
                                          widget.basket.product!.shop!.priceLevel ==
                                              PsConst.PRICE_HIGH
                                      ? PsColors.priceLevelColor
                                      : PsColors.grey),
                              maxLines: 2,
                            ),
                            Text(
                              '\$',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: widget.basket.product!.shop!.priceLevel ==
                                          PsConst.PRICE_HIGH
                                      ? PsColors.priceLevelColor
                                      : PsColors.grey),
                              maxLines: 2,
                            ),
                            const SizedBox(width: PsDimens.space8),
                            Text(
                             widget.basket.product!.shop!.highlightedInfo!,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
              ],
            ),
          )]
        );
      } else {
        return Container();
    }
  }
}
