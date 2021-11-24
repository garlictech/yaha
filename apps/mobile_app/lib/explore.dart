import 'package:flutter/material.dart';
import 'package:yaha/search-results-screen.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yaha/utility/yaha-text-input.dart';

import 'filter/filter-page.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
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
                              fontSize: YahaFontSizes.medium,
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
                            width: YahaIconSizes.medium,
                          ),
                          onPressed: () => showBarModalBottomSheet(
                            expand: false,
                            useRootNavigator: true,
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                controller: ModalScrollController.of(context),
                                child: Container(
                                  color: YahaColors.accentColor,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: YahaSpaceSizes.medium,
                                          right: YahaSpaceSizes.general,
                                        ),
                                        color: YahaColors.accentColor,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Text("Reset"),
                                                style: TextButton.styleFrom(
                                                  primary: YahaColors
                                                      .secondaryAccentColor,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Filters",
                                                style: TextStyle(
                                                  fontSize: YahaFontSizes.small,
                                                  fontWeight: FontWeight.w600,
                                                  color: YahaColors.textColor,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Icon(
                                                  Icons.close_outlined,
                                                  color: YahaColors
                                                      .secondaryAccentColor,
                                                ),
                                              ),
                                            ),
                                          ],
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
                    child: YahaTextField(title: "Search for hike")),
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: YahaTextField(
                    title: 'Search around location',
                    icon: Icons.gps_not_fixed,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: YahaSpaceSizes.general),
                  child: SizedBox(
                    height: YahaBoxSizes.buttonHeight,
                    width: YahaBoxSizes.buttonWidthBig,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.search,
                        color: YahaColors.accentColor,
                        size: YahaFontSizes.large,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResultsScreen()));
                      },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
