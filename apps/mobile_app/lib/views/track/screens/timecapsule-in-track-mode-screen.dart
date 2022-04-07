import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/profile/time-capsules/views/widgets/poi-with-image-widget.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class TimeCapsuleInTrackModeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    return Scaffold(
      backgroundColor: YahaColors.timeCapsuleBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'TimeCapsule',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: YahaFontSizes.medium,
            color: YahaColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: YahaSpaceSizes.xSmall),
            child: IconButton(
              icon: Icon(Icons.close_outlined),
              onPressed: () {},
              color: YahaColors.textColor,
              iconSize: YahaIconSizes.large,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: YahaSpaceSizes.general,
                        right: YahaSpaceSizes.general),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.medium,
                              bottom: YahaSpaceSizes.semiLarge),
                          child: PoiWithImageWidget(
                            backgroundColor: YahaColors.timeCapsule,
                            image: 'assets/images/timecapsule.png',
                            radius: 40,
                            padding: YahaSpaceSizes.small,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.small),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    right: YahaSpaceSizes.small),
                                child: Icon(
                                  Icons.person_rounded,
                                  color: YahaColors.textColor,
                                  size: YahaIconSizes.medium,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize: YahaFontSizes.small),
                                  children: [
                                    TextSpan(
                                      text: 'Who',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(text: ' placed it: John Doe')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    right: YahaSpaceSizes.small),
                                child: Icon(
                                  Icons.people_rounded,
                                  color: YahaColors.textColor,
                                  size: YahaIconSizes.medium,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize: YahaFontSizes.small),
                                  children: [
                                    TextSpan(
                                      text: 'How many',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(text: ' users have found it: 124')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.email_rounded,
                              size: YahaIconSizes.xxLarge,
                              color: YahaColors.textColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: YahaSpaceSizes.small,
                                  top: YahaSpaceSizes.xSmall),
                              child: Text(
                                'Content',
                                style: TextStyle(
                                    color: YahaColors.textColor,
                                    fontSize: YahaFontSizes.medium,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: YahaSpaceSizes.small),
                              child: Text(
                                'The content of the TimeCapsule goes here. It can be a text entry or some pictures.',
                                style: TextStyle(
                                    color: YahaColors.textColor,
                                    fontSize: YahaFontSizes.small),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general),
                              child: Image.asset(
                                  'assets/images/time-capsule-picture.jpg'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xLarge,
                              bottom: YahaSpaceSizes.medium),
                          child: SizedBox(
                            height: YahaBoxSizes.buttonHeight,
                            width: YahaBoxSizes.buttonWidthBig,
                            child: ElevatedButton.icon(
                              icon: Padding(
                                padding: const EdgeInsets.only(
                                    top: YahaSpaceSizes.xSmall),
                                child: Icon(
                                  Icons.chat_rounded,
                                  color: YahaColors.textColor,
                                  size: YahaFontSizes.large,
                                ),
                              ),
                              onPressed: () {},
                              label: Text(
                                'Open comments',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.textColor),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: YahaColors.timeCapsule,
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
          )
        ],
      ),
    );
  }
}
