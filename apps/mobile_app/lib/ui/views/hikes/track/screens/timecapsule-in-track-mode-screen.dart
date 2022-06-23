import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/time-capsules/widgets/poi-with-image-widget.dart';

import '../../../shared/shared.dart';

class TimeCapsuleInTrackModeScreen extends ConsumerWidget {
  const TimeCapsuleInTrackModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: YahaColors.timeCapsuleBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
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
              icon: const Icon(Icons.close_outlined),
              onPressed: () {},
              color: YahaColors.textColor,
              iconSize: YahaIconSizes.large,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
                          child: const PoiWithImageWidget(
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
                                child: const Icon(
                                  Icons.person_rounded,
                                  color: YahaColors.textColor,
                                  size: YahaIconSizes.medium,
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
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
                                child: const Icon(
                                  Icons.people_rounded,
                                  color: YahaColors.textColor,
                                  size: YahaIconSizes.medium,
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
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
                            const Icon(
                              Icons.email_rounded,
                              size: YahaIconSizes.xxLarge,
                              color: YahaColors.textColor,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
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
                            const Padding(
                              padding:
                                  EdgeInsets.only(bottom: YahaSpaceSizes.small),
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
                              icon: const Padding(
                                padding:
                                    EdgeInsets.only(top: YahaSpaceSizes.xSmall),
                                child: Icon(
                                  Icons.chat_rounded,
                                  color: YahaColors.textColor,
                                  size: YahaFontSizes.large,
                                ),
                              ),
                              onPressed: () {},
                              label: const Text(
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
