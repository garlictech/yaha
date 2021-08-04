import 'package:flutter/material.dart';
import 'package:yaha/search-result.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'filter/filter-page.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(YahaSpaceSizes.general),
                      child: Text('Explore',
                          style: TextStyle(
                              fontSize: YahaFontSizes.large,
                              fontWeight: FontWeight.w600,
                              color: YahaColors.textColor)),
                    ),
                    Container(
                      padding: EdgeInsets.all(YahaSpaceSizes.general),
                      child: TextFormField(
                        onTap: () {
                          Navigator.of(this.context).push(
                              new MaterialPageRoute<dynamic>(
                                  builder: (BuildContext context) {
                            return new SearchResultPage();
                          }));
                        },
                        keyboardType: TextInputType.text,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: YahaColors.textColor,
                            fontSize: YahaFontSizes.small),
                        decoration: InputDecoration(
                            labelText: 'Search for hike',
                            contentPadding:
                                EdgeInsets.only(left: YahaSpaceSizes.medium),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.small),
                                borderSide: BorderSide(
                                    color: YahaColors.textColor,
                                    width: YahaBorderWidth.small)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.small),
                                borderSide: BorderSide(
                                    color: YahaColors.secondary,
                                    width: YahaBorderWidth.small))),
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: YahaSpaceSizes.general,
                                right: YahaSpaceSizes.small),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: YahaColors.textColor,
                                  fontSize: YahaFontSizes.small),
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.gps_not_fixed,
                                      color: YahaColors.textColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                  labelText: 'Search around location',
                                  contentPadding: EdgeInsets.only(
                                      left: YahaSpaceSizes.medium),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          YahaBorderRadius.small),
                                      borderSide: BorderSide(
                                          color: YahaColors.textColor,
                                          width: YahaBorderWidth.small)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          YahaBorderRadius.small),
                                      borderSide: BorderSide(
                                          color: YahaColors.secondary,
                                          width: YahaBorderWidth.small))),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                left: YahaSpaceSizes.small,
                                right: YahaSpaceSizes.general),
                            child: IconButton(
                                iconSize: YahaFontSizes.xxLarge,
                                icon: CircleAvatar(
                                  backgroundColor: YahaColors.primary,
                                  radius: YahaBorderRadius.poiLarge,
                                  child: Icon(
                                    Icons.filter_list,
                                    color: YahaColors.background,
                                  ),
                                ),
                                onPressed: () => showBarModalBottomSheet(
                                      expand: false,
                                      context: context,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                            controller:
                                                ModalScrollController.of(
                                                    context),
                                            child: Container(
                                                color: YahaColors
                                                    .tertiaryAccentColor,
                                                child: Column(children: [
                                                  ListTile(
                                                    leading: Container(
                                                      color: YahaColors
                                                          .tertiaryAccentColor,
                                                      child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Icon(Icons
                                                              .arrow_back) // the arrow back icon
                                                          ),
                                                    ),
                                                    title: Center(
                                                        child: Text(
                                                            "Filters") // Your desired title
                                                        ),
                                                  ),
                                                  Container(
                                                      color:
                                                          YahaColors.background,
                                                      child: FilterPage())
                                                ])));
                                      },
                                    ))),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(YahaSpaceSizes.general),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.search,
                            color: YahaColors.accentColor,
                            size: YahaFontSizes.large,
                          ),
                          onPressed: () {},
                          label: Text('Explore',
                              style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                              )),
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.primary,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                  ]),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
