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
                  child: Container(
                    padding: EdgeInsets.only(
                      left: YahaSpaceSizes.general,
                      right: YahaSpaceSizes.general,
                      top: YahaSpaceSizes.small,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: Text(
                                  'Explore',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.large,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                child: IconButton(
                                  iconSize: YahaFontSizes.xxLarge,
                                  icon: Image.asset(
                                    'assets/images/filter-icon.png',
                                    //width: 28.0,
                                  ),
                                  onPressed: () => showBarModalBottomSheet(
                                    expand: false,
                                    context: context,
                                    builder: (context) {
                                      return SingleChildScrollView(
                                        controller:
                                            ModalScrollController.of(context),
                                        child: Container(
                                          color: YahaColors.tertiaryAccentColor,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: Container(
                                                  color: YahaColors
                                                      .tertiaryAccentColor,
                                                  child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
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
                                                color: YahaColors.background,
                                                child: FilterPage(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 400),
                          padding: EdgeInsets.only(
                              bottom: YahaSpaceSizes.general,
                              top: YahaSpaceSizes.general),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: YahaColors.textColor,
                                fontSize: YahaFontSizes.small),
                            decoration: InputDecoration(
                                labelText: 'Search for hike',
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
                        Container(
                          constraints: BoxConstraints(maxWidth: 400),
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
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general),
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
                                        Radius.circular(
                                            YahaBorderRadius.general))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
