import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaha/auth/login-popup.dart';
import 'package:yaha/settings/application/application-page.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: YahaColors.background,
          title: const Text('Settings',
              style: TextStyle(
                  fontSize: YahaFontSizes.large,
                  fontWeight: FontWeight.w600,
                  color: YahaColors.textColor)),
          leading: IconButton(
            iconSize: YahaFontSizes.xxLarge,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: YahaColors.textColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    child: Column(
                      children: [
                        // Container(
                        //   padding: const EdgeInsets.all(YahaSpaceSizes.general),
                        //   child: Text('Settings',
                        //       textAlign: TextAlign.center,
                        //       style: TextStyle(
                        //           fontSize: YahaFontSizes.large,
                        //           fontWeight: FontWeight.w600,
                        //           color: YahaColors.textColor)),
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: YahaSpaceSizes.general,
                              top: YahaSpaceSizes.medium,
                              bottom: YahaSpaceSizes.medium),
                          child: Text('Account',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.medium,
                                  fontWeight: FontWeight.w600,
                                  color: YahaColors.textColor)),
                          decoration: BoxDecoration(
                              color: YahaColors.tertiaryAccentColor),
                          height: 56.0,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: YahaSpaceSizes.general,
                                    top: YahaSpaceSizes.small,
                                    right: YahaSpaceSizes.general,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Edit profile',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w400,
                                            color: YahaColors.textColor)),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: YahaColors.primary,
                                      size: YahaFontSizes.xxLarge,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  child: Divider(
                                      color: YahaColors.divider,
                                      thickness: 0.5)),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: YahaSpaceSizes.general,
                                    top: YahaSpaceSizes.small,
                                    right: YahaSpaceSizes.general,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Notifications',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w400,
                                            color: YahaColors.textColor)),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: YahaColors.primary,
                                      size: YahaFontSizes.xxLarge,
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                  color: YahaColors.divider, thickness: 0.5),
                              InkWell(
                                onTap: () {
                                  Navigator.of(this.context).push(
                                      new MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) {
                                    return new ApplicationPage();
                                  }));
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: YahaSpaceSizes.general,
                                      top: YahaSpaceSizes.small,
                                      right: YahaSpaceSizes.general,
                                      bottom: YahaSpaceSizes.small),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Application',
                                          style: TextStyle(
                                              fontSize: YahaFontSizes.small,
                                              fontWeight: FontWeight.w400,
                                              color: YahaColors.textColor)),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: YahaColors.primary,
                                        size: YahaFontSizes.xxLarge,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                  color: YahaColors.divider, thickness: 0.5),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: YahaSpaceSizes.general,
                                    top: YahaSpaceSizes.small,
                                    right: YahaSpaceSizes.general,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Offline maps',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w400,
                                            color: YahaColors.textColor)),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: YahaColors.primary,
                                      size: YahaFontSizes.xxLarge,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: YahaSpaceSizes.general,
                              top: YahaSpaceSizes.medium,
                              bottom: YahaSpaceSizes.medium),
                          child: Text('Support',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.medium,
                                  fontWeight: FontWeight.w600,
                                  color: YahaColors.textColor)),
                          decoration: BoxDecoration(
                              color: YahaColors.tertiaryAccentColor),
                          height: 56.0,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: YahaSpaceSizes.general,
                                    top: YahaSpaceSizes.small,
                                    right: YahaSpaceSizes.general,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Help and feedback',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w400,
                                            color: YahaColors.textColor)),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: YahaColors.primary,
                                      size: YahaFontSizes.xxLarge,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  child: Divider(
                                      color: YahaColors.divider,
                                      thickness: 0.5)),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: YahaSpaceSizes.general,
                                    top: YahaSpaceSizes.small,
                                    right: YahaSpaceSizes.general,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Privacy policy',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w400,
                                            color: YahaColors.textColor)),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: YahaColors.primary,
                                      size: YahaFontSizes.xxLarge,
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                  color: YahaColors.divider, thickness: 0.5),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: YahaSpaceSizes.general,
                                    top: YahaSpaceSizes.small,
                                    right: YahaSpaceSizes.general,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Terms and conditions',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w400,
                                            color: YahaColors.textColor)),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: YahaColors.primary,
                                      size: YahaFontSizes.xxLarge,
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: false,
                                child: Divider(
                                    color: YahaColors.divider, thickness: 0.5),
                              ),
                              Visibility(
                                visible: false,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: YahaSpaceSizes.general,
                                      top: YahaSpaceSizes.small,
                                      right: YahaSpaceSizes.general,
                                      bottom: YahaSpaceSizes.small),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Log out',
                                          style: TextStyle(
                                              fontSize: YahaFontSizes.small,
                                              fontWeight: FontWeight.w400,
                                              color: YahaColors.error)),
                                      Icon(
                                        Icons.exit_to_app_rounded,
                                        color: YahaColors.error,
                                        size: YahaFontSizes.xxLarge,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(
                                    YahaSpaceSizes.general),
                                child: SizedBox(
                                  height: 50,
                                  width: 400,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LogInPopup()));
                                    },
                                    child: Text('Log in',
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
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
