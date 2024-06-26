import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/shared.dart';
import '../widgets/poi-with-image-widget.dart';

class TimeCapsuleDetailsScreen extends ConsumerWidget {
  final bool whoPlacedItVisibility;
  final bool contentVisibility;

  const TimeCapsuleDetailsScreen({
    Key? key,
    required this.whoPlacedItVisibility,
    required this.contentVisibility,
  }) : super(key: key);

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
        leading: const YahaBackButton(),
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
                                top: YahaSpaceSizes.general,
                                bottom: YahaSpaceSizes.general),
                            child: const PoiWithImageWidget(
                              backgroundColor: YahaColors.timeCapsule,
                              image: 'assets/images/timecapsule.png',
                              radius: 40,
                              padding: YahaSpaceSizes.small,
                            )),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.small),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    right: YahaSpaceSizes.small),
                                child: const Icon(
                                  Icons.watch_later_rounded,
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
                                      text: 'When',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                        text: ' did you find it: 12.11.2021')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.small),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: YahaSpaceSizes.small),
                                    child: const Icon(
                                      Icons.place_rounded,
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
                                          text: 'Where',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        TextSpan(text: ' did you find it:')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 39, top: YahaSpaceSizes.xSmall),
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                        color: YahaColors.textColor,
                                        fontSize: YahaFontSizes.small),
                                    children: [
                                      TextSpan(
                                        text: 'Hike:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      TextSpan(text: ' Budapest')
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 39, top: YahaSpaceSizes.xSmall),
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                        color: YahaColors.textColor,
                                        fontSize: YahaFontSizes.small),
                                    children: [
                                      TextSpan(
                                        text: 'Latitude:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      TextSpan(text: ' 47.4979937')
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 39,
                                    top: YahaSpaceSizes.xSmall,
                                    bottom: YahaSpaceSizes.general),
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                        color: YahaColors.textColor,
                                        fontSize: YahaFontSizes.small),
                                    children: [
                                      TextSpan(
                                        text: 'Longitude:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      TextSpan(text: ' 19.0403594')
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 340,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      YahaBorderRadius.general),
                                  child: Image.asset(
                                    'assets/images/poi_page.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: whoPlacedItVisibility,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.general,
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
                        Visibility(
                          visible: contentVisibility,
                          child: Column(
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
                                padding: EdgeInsets.only(
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
