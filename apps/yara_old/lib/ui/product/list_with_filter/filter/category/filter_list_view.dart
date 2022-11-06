import 'package:flutter/material.dart';
import 'package:yara/config/ps_colors.dart';
import 'package:yara/constant/ps_constants.dart';
import 'package:yara/provider/category/category_provider.dart';
import 'package:yara/repository/category_repository.dart';
import 'package:yara/ui/common/base/ps_widget_with_appbar.dart';
import 'package:yara/ui/common/ps_admob_banner_widget.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:yara/viewobject/holder/category_parameter_holder.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'filter_expantion_tile_view.dart';

class FilterListView extends StatefulWidget {
  const FilterListView({this.selectedData});

  final dynamic selectedData;

  @override
  State<StatefulWidget> createState() => _FilterListViewState();
}

class _FilterListViewState extends State<FilterListView> {
  final ScrollController _scrollController = ScrollController();

  final CategoryParameterHolder categoryIconList =
      CategoryParameterHolder().getLatestParameterHolder();
  CategoryRepository? categoryRepository;
  PsValueHolder? psValueHolder;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onSubCategoryClick(Map<String, String> subCategory) {
    Navigator.pop(context, subCategory);
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
    return PsWidgetWithAppBar<CategoryProvider>(
        appBarTitle: Utils.getString(context, 'search__category') ,
        initProvider: () {
          return CategoryProvider(
              repo: categoryRepository!, psValueHolder: psValueHolder!);
        },
        onProviderReady: (CategoryProvider provider) {
          provider.loadCategoryList(categoryIconList);
        },
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list,
                color: PsColors.mainColor),
            onPressed: () {
              final Map<String, String> dataHolder = <String, String>{};
              dataHolder[PsConst.CATEGORY_ID] = '';
              dataHolder[PsConst.SUB_CATEGORY_ID] = '';
              dataHolder[PsConst.CATEGORY_NAME] = '';
              onSubCategoryClick(dataHolder);
            },
          )
        ],
        builder:
            (BuildContext context, CategoryProvider provider, Widget? child) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const PsAdMobBannerWidget(admobSize: AdSize.banner),
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: provider.categoryList.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (provider.categoryList.data != null ||
                              provider.categoryList.data!.isEmpty) {
                            return FilterExpantionTileView(
                                selectedData: widget.selectedData,
                                category: provider.categoryList.data![index],
                                onSubCategoryClick: onSubCategoryClick);
                          } else {
                            return Container();
                          }
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
