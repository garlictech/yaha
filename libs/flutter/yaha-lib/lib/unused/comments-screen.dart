import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/shared.dart';
import '../widgets/comment-widget.dart';

class CommentsScreen extends ConsumerWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: const Text(
          'Comments',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: YahaFontSizes.medium,
            color: YahaColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const YahaBackButton(),
        actions: [
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.only(right: YahaSpaceSizes.medium),
              child: IconButton(
                icon: const Icon(Icons.add_rounded,
                    size: YahaIconSizes.large, color: YahaColors.textColor),
                onPressed: () {},
              ),
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: YahaSpaceSizes.general,
                        right: YahaSpaceSizes.general,
                        top: YahaSpaceSizes.general),
                    child: Column(
                      children: [
                        const Comment(
                          profilePicture:
                              'packages/flutter_yaha_lib/assets/images/profile-authenticated.png',
                          name: 'John Doe',
                          date: '2021.04.05',
                          commment: 'This is a rather short comment.',
                        ),
                        const Comment(
                          profilePicture:
                              'packages/flutter_yaha_lib/assets/images/profile-authenticated.png',
                          name: 'John Doe',
                          date: '2021.04.06',
                          commment:
                              'This is a little bit longer comment than the first one was.',
                        ),
                        const Comment(
                          profilePicture:
                              'packages/flutter_yaha_lib/assets/images/profile-authenticated.png',
                          name: 'John Doe',
                          date: '2021.04.07',
                          commment:
                              'This is a really really super duper long multi-line comment from Jonh Doe because he liked the hike so much.',
                        ),
                        const Comment(
                          profilePicture:
                              'packages/flutter_yaha_lib/assets/images/profile-authenticated.png',
                          name: 'John Doe',
                          date: '2021.04.08',
                          commment:
                              'This is the looooooongest comment on the whole screen. It is soooooo loooong that it takes up more than three lines and it is really tiring to read it.',
                        ),
                        Visibility(
                          visible: true,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.close_rounded,
                                      size: YahaIconSizes.medium,
                                      color: YahaColors.textColor,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: YahaSpaceSizes.small),
                                    child: Text(
                                      'Leave a comment',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small,
                                          color: YahaColors.textColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: YahaSpaceSizes.xSmall,
                                    bottom: YahaSpaceSizes.general),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      YahaBorderRadius.general),
                                  child: const TextField(
                                    cursorColor: YahaColors.textColor,
                                    maxLines: 10,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: YahaColors.accentColor,
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: YahaSpaceSizes.general),
                                child: SizedBox(
                                  height: YahaBoxSizes.buttonHeight,
                                  width: YahaBoxSizes.buttonWidthBig,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.send_rounded,
                                      color: YahaColors.accentColor,
                                      size: YahaFontSizes.large,
                                    ),
                                    onPressed: () {},
                                    label: const Text('Send',
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
          ),
        ],
      ),
    );
  }
}
