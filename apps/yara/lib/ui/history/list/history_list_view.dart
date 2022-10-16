import 'package:flutter/material.dart';
import 'package:fluttermultirestaurant/constant/ps_constants.dart';
import 'package:fluttermultirestaurant/constant/ps_dimens.dart';
import 'package:fluttermultirestaurant/constant/route_paths.dart';
import 'package:fluttermultirestaurant/provider/history/history_provider.dart';
import 'package:fluttermultirestaurant/repository/history_repsitory.dart';
import 'package:fluttermultirestaurant/ui/common/ps_admob_banner_widget.dart';
import 'package:fluttermultirestaurant/ui/common/ps_ui_widget.dart';
import 'package:fluttermultirestaurant/ui/history/item/history_list_item.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_value_holder.dart';
import 'package:fluttermultirestaurant/viewobject/holder/intent_holder/product_detail_intent_holder.dart';
import 'package:fluttermultirestaurant/viewobject/product.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';


class HistoryListView extends StatefulWidget {
  const HistoryListView({
    Key? key, 
    @required this.animationController})
      : super(key: key);
  final AnimationController? animationController;
  @override
  _HistoryListViewState createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView>
    with SingleTickerProviderStateMixin {
  HistoryRepository? historyRepo;
  PsValueHolder? psValueHolder;
  dynamic data;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
    historyRepo = Provider.of<HistoryRepository>(context);
    psValueHolder = Provider.of<PsValueHolder>(context, listen: false);

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
    return ChangeNotifierProvider<HistoryProvider>(
        lazy: false,
        create: (BuildContext context) {
          final HistoryProvider provider = HistoryProvider(
            repo: historyRepo,
            psValueHolder: psValueHolder!
          );
          provider.loadHistoryList();
          return provider;
        },
        child: Consumer<HistoryProvider>(
          builder:
              (BuildContext context, HistoryProvider provider, Widget? child) {
            if (provider.historyList.data != null) {
              return Column(
                children: <Widget>[
                  const PsAdMobBannerWidget(
                    admobSize: AdSize.banner
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: PsDimens.space10),
                      child: RefreshIndicator(
                        child: CustomScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            slivers: <Widget>[
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    final int count =
                                        provider.historyList.data!.length;
                                    return HistoryListItem(
                                      animationController:
                                          widget.animationController,
                                      animation:
                                          Tween<double>(begin: 0.0, end: 1.0)
                                              .animate(
                                        CurvedAnimation(
                                          parent: widget.animationController!,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn),
                                        ),
                                      ),
                                      history: provider
                                          .historyList.data!.reversed
                                          .toList()[index],
                                      onTap: () {
                                        final Product product = provider
                                            .historyList.data!.reversed
                                            .toList()[index];
                                        final ProductDetailIntentHolder holder =
                                            ProductDetailIntentHolder(
                                          productId: product.id,
                                          heroTagImage:
                                              provider.hashCode.toString() +
                                                  product.id! +
                                                  PsConst.HERO_TAG__IMAGE,
                                          heroTagTitle:
                                              provider.hashCode.toString() +
                                                  product.id! +
                                                  PsConst.HERO_TAG__TITLE,
                                          heroTagOriginalPrice: provider
                                                  .hashCode
                                                  .toString() +
                                              product.id! +
                                              PsConst.HERO_TAG__ORIGINAL_PRICE,
                                          heroTagUnitPrice:
                                              provider.hashCode.toString() +
                                                  product.id! +
                                                  PsConst.HERO_TAG__UNIT_PRICE,
                                        );

                                        Navigator.pushNamed(
                                            context, RoutePaths.productDetail,
                                            arguments: holder);
                                      },
                                    );
                                  },
                                  childCount: provider.historyList.data!.length,
                                ),
                              )
                            ]),
                        onRefresh: () {
                          return provider.resetHistoryList();
                        },
                      ),
                    ),
                  ),
                  PSProgressIndicator(provider.historyList.status),
                ],
              );
            } else {
              return Container();
            }
          },
        ));
  }
}

