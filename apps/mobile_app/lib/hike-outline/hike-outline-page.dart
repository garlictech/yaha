import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yaha/hike-outline/checkpoint.dart';
import 'package:yaha/hike-outline/settings/hike-outline-settings.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/buttons/settings-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class HikeOutlinePage extends StatefulWidget {
  @override
  _HikeOutlineState createState() => _HikeOutlineState();
}

class _HikeOutlineState extends State<HikeOutlinePage> {
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
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: YahaSpaceSizes.medium,
                          right: YahaSpaceSizes.medium,
                          top: YahaSpaceSizes.small,
                          bottom: YahaSpaceSizes.large,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: YahaBackButton(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('Hike Outline',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.large,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SettingsButton(),
                            ),
                            Positioned(
                              right: 55.0,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          YahaBorderRadius.small),
                                      child: Container(
                                        height: YahaBoxSizes.backButtonHeight,
                                        width: YahaBoxSizes.backButtonWidth,
                                        color:
                                            YahaColors.smallButtonsBackground,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => showBarModalBottomSheet(
                                        expand: false,
                                        useRootNavigator: true,
                                        context: context,
                                        builder: (context) {
                                          return SingleChildScrollView(
                                            controller:
                                                ModalScrollController.of(
                                                    context),
                                            child: Container(
                                              color: YahaColors
                                                  .tertiaryAccentColor,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                      left:
                                                          YahaSpaceSizes.medium,
                                                      right: YahaSpaceSizes
                                                          .general,
                                                    ),
                                                    color: YahaColors
                                                        .tertiaryAccentColor,
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: TextButton(
                                                            onPressed: () {},
                                                            child:
                                                                Text("Reset"),
                                                            style: TextButton
                                                                .styleFrom(
                                                              primary: YahaColors
                                                                  .secondaryAccentColor,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "Customize hike",
                                                            style: TextStyle(
                                                              fontSize:
                                                                  YahaFontSizes
                                                                      .small,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: YahaColors
                                                                  .textColor,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .close_outlined,
                                                              color: YahaColors
                                                                  .secondaryAccentColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    color:
                                                        YahaColors.background,
                                                    child:
                                                        HikeOutlineSettings(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      icon: Image.asset(
                                        'assets/images/filter-icon.png',
                                        width: 26.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Checkpoint(
                        title: "Home",
                        boxBackgorundColor: YahaColors.secondary,
                        backgroundColor: YahaColors.secondary,
                        icon: Icons.outlined_flag_rounded,
                        iconSize: 40,
                        estimatedArrival: "11:30",
                      )
                    ],
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
