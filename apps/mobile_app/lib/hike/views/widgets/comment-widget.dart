import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class Comment extends ConsumerWidget {
  final String profilePicture;
  final String name;
  final String date;
  final String commment;

  const Comment(
      {Key? key,
      required this.profilePicture,
      required this.name,
      required this.date,
      required this.commment})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Padding(
      padding: const EdgeInsets.only(bottom: YahaSpaceSizes.large),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: YahaBoxSizes.commentProfilePictureHeight,
                width: YahaBoxSizes.commentProfilePictureWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(YahaBorderRadius.small),
                  child: Image.asset(profilePicture),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          color: YahaColors.textColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: YahaSpaceSizes.xxSmall),
                      child: Text(
                        date,
                        style: TextStyle(
                            fontSize: YahaFontSizes.xSmall,
                            color: YahaColors.textColor,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: YahaSpaceSizes.xSmall),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              child: Container(
                padding: const EdgeInsets.only(
                    top: YahaSpaceSizes.small,
                    right: YahaSpaceSizes.medium,
                    bottom: YahaSpaceSizes.small,
                    left: YahaSpaceSizes.medium),
                color: YahaColors.accentColor,
                width: MediaQuery.of(context).size.width,
                constraints:
                    BoxConstraints(maxHeight: YahaBoxSizes.heightGeneral),
                child: Text(commment),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
