import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/presenters/personal/settings-screen-presenter.dart';
import 'package:yaha/ui/views/hikes/list-section-title-box-widget.dart';
import 'package:yaha/ui/views/shared/shared.dart';

import 'account-screen.dart';
import 'application-screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsScreenMVPProvider);
    final presenter = ref.watch(settingsScreenMVPProvider.notifier);

    return Scaffold(
      appBar: AppBar(
          //leading: YahaBackButton(),
          title: const Text(
        'Settings',
      )),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
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
                      const ListSectionTitleBox(
                        title: 'Account',
                        backgroundColor: YahaColors.accentColor,
                        titleColor: YahaColors.textColor,
                        iconVisibility: false,
                      ),
                      Column(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute<AccountScreen>(
                                        builder: (context) =>
                                            const AccountScreen()));
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
                                  children: const [
                                    Text('Edit profile',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w400,
                                            color: YahaColors.textColor)),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      size: YahaFontSizes.xxLarge,
                                    )
                                  ],
                                ),
                              )),
                          const Divider(
                              color: YahaColors.divider, thickness: 0.5),
                          /*    Container(
                            padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.general,
                                top: YahaSpaceSizes.small,
                                right: YahaSpaceSizes.general,
                                bottom: YahaSpaceSizes.small),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Notifications',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w400,
                                        color: YahaColors.textColor)),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: YahaFontSizes.xxLarge,
                                )
                              ],
                            ),
                          ),
                          const Divider(
                              color: YahaColors.divider, thickness: 0.5),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) {
                                return const ApplicationScreen();
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
                                children: const [
                                  Text('Application',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    size: YahaFontSizes.xxLarge,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                              color: YahaColors.divider, thickness: 0.5),
                          Container(
                            padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.general,
                                top: YahaSpaceSizes.small,
                                right: YahaSpaceSizes.general,
                                bottom: YahaSpaceSizes.small),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Offline maps',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w400,
                                        color: YahaColors.textColor)),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: YahaFontSizes.xxLarge,
                                )
                              ],
                            ),
                          ),
                          */
                        ],
                      ),
                      /* const ListSectionTitleBox(
                        title: 'Support',
                        backgroundColor: YahaColors.accentColor,
                        titleColor: YahaColors.textColor,
                        iconVisibility: false,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.general,
                                top: YahaSpaceSizes.small,
                                right: YahaSpaceSizes.general,
                                bottom: YahaSpaceSizes.small),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Help and feedback',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w400,
                                        color: YahaColors.textColor)),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: YahaFontSizes.xxLarge,
                                )
                              ],
                            ),
                          ),
                          const Divider(
                              color: YahaColors.divider, thickness: 0.5),
                          Container(
                            padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.general,
                                top: YahaSpaceSizes.small,
                                right: YahaSpaceSizes.general,
                                bottom: YahaSpaceSizes.small),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Privacy policy',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w400,
                                        color: YahaColors.textColor)),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: YahaFontSizes.xxLarge,
                                )
                              ],
                            ),
                          ),
                          const Divider(
                              color: YahaColors.divider, thickness: 0.5),
                          Container(
                            padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.general,
                                top: YahaSpaceSizes.small,
                                right: YahaSpaceSizes.general,
                                bottom: YahaSpaceSizes.small),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Terms and conditions',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w400,
                                        color: YahaColors.textColor)),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: YahaFontSizes.xxLarge,
                                )
                              ],
                            ),
                          ),
                          const Visibility(
                            visible: false,
                            child: Divider(
                                color: YahaColors.divider, thickness: 0.5),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.general,
                                top: YahaSpaceSizes.small,
                                right: YahaSpaceSizes.general,
                                bottom: YahaSpaceSizes.small),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: presenter.doLogout,
                                    child: const Text('Log out',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w400,
                                            color: YahaColors.error))),
                                const Icon(
                                  Icons.exit_to_app_rounded,
                                  color: YahaColors.error,
                                  size: YahaFontSizes.xxLarge,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),*/
                    ],
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
