import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/hike/views/widgets/comment-widget.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class CommentsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: Text(
          'Comments',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: YahaFontSizes.medium,
            color: YahaColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: YahaBackButton(),
        actions: [
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.only(right: YahaSpaceSizes.medium),
              child: IconButton(
                icon: Icon(Icons.add_rounded,
                    size: YahaIconSizes.large, color: YahaColors.textColor),
                onPressed: () {},
              ),
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: YahaSpaceSizes.general,
                        right: YahaSpaceSizes.general,
                        top: YahaSpaceSizes.general),
                    child: Column(
                      children: [
                        Comment(
                          profilePicture:
                              'assets/images/profile-authenticated.png',
                          name: 'John Doe',
                          date: '2021.04.05',
                          commment: 'This is a rather short comment.',
                        ),
                        Comment(
                          profilePicture:
                              'assets/images/profile-authenticated.png',
                          name: 'John Doe',
                          date: '2021.04.06',
                          commment:
                              'This is a little bit longer comment than the first one was.',
                        ),
                        Comment(
                          profilePicture:
                              'assets/images/profile-authenticated.png',
                          name: 'John Doe',
                          date: '2021.04.07',
                          commment:
                              'This is a really really super duper long multi-line comment from Jonh Doe because he liked the hike so much.',
                        ),
                        Comment(
                          profilePicture:
                              'assets/images/profile-authenticated.png',
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
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: YahaIconSizes.medium,
                                      color: YahaColors.textColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
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
                                  child: TextField(
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
                                    icon: Icon(
                                      Icons.send_rounded,
                                      color: YahaColors.accentColor,
                                      size: YahaFontSizes.large,
                                    ),
                                    onPressed: () {},
                                    label: Text('Send',
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
