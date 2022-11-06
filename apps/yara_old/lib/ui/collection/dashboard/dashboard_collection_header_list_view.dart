import 'package:flutter/material.dart';
import 'package:yara/constant/ps_constants.dart';
import 'package:yara/constant/route_paths.dart';
import 'package:yara/provider/productcollection/product_collection_provider.dart';
import 'package:yara/repository/product_collection_repository.dart';
import 'package:yara/ui/collection/item/dashboard_collection_header_list_item.dart';
import 'package:yara/ui/common/ps_ui_widget.dart';
import 'package:yara/ui/product/collection_product/product_list_by_collection_id_view.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:provider/provider.dart';

class DashboardCollectionHeaderListView extends StatefulWidget {
  const DashboardCollectionHeaderListView({Key? key, required this.shopId})
      : super(key: key);
  final String shopId;
  @override
  State<StatefulWidget> createState() => _CollectionHeaderListItem();
}

class _CollectionHeaderListItem extends State<DashboardCollectionHeaderListView>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();
  ProductCollectionProvider? _productCollectionProvider;
  ProductCollectionRepository? productCollectionRepository;
  PsValueHolder? psValueHolder;
  dynamic data;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _productCollectionProvider!
            .nextProductCollectionListByShopId(widget.shopId);
      }
    });

    super.initState();
  }

  bool isConnectedToInternet = false;
  bool isSuccessfullyLoaded = true;
  bool isShowAdmob = true;

  void checkConnection(PsValueHolder psValueHolder) {
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
    super.build(context);
    productCollectionRepository =
        Provider.of<ProductCollectionRepository>(context);
    psValueHolder = Provider.of<PsValueHolder>(context);

    if (psValueHolder!.isShowAdmob != null &&
        psValueHolder!.isShowAdmob == PsConst.ONE) {
        isShowAdmob = true;
    } else {
        isShowAdmob = false;
    }
    if (!isConnectedToInternet && isShowAdmob) {
      print('loading ads....');
      checkConnection(psValueHolder!);
    }

    return ChangeNotifierProvider<ProductCollectionProvider>(
      lazy: false,
      create: (BuildContext context) {
        final ProductCollectionProvider provider =
            ProductCollectionProvider(
              repo: productCollectionRepository,
              psValueHolder: psValueHolder);
        provider.loadProductCollectionListByShopId(widget.shopId);
        _productCollectionProvider = provider;
        return _productCollectionProvider!;
      },
      child: Consumer<ProductCollectionProvider>(builder: (BuildContext context,
          ProductCollectionProvider provider, Widget? child) {
        return Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: RefreshIndicator(
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller: _scrollController,
                          itemCount: provider.productCollectionList.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (provider.productCollectionList.data != null ||
                                provider.productCollectionList.data!.isEmpty) {
                              return DashboardCollectionHeaderListItem(
                                productCollectionHeader:
                                    provider.productCollectionList.data![index],
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      RoutePaths.productListByCollectionId,
                                      arguments: ProductListByCollectionIdView(
                                        productCollectionHeader: provider
                                            .productCollectionList.data![index],
                                        appBarTitle: provider
                                            .productCollectionList
                                            .data![index]
                                            .name!,
                                      ));
                                },
                              );
                            } else {
                              return Container();
                            }
                          }),
                      onRefresh: () {
                        return provider
                            .resetProductCollectionListByShopId(widget.shopId);
                      },
                    ),
                  ),
                  PSProgressIndicator(provider.productCollectionList.status)
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
