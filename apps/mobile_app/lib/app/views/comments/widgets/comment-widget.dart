import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart' as domain;

import '../../shared/widgets/yaha-border-radius.dart';
import '../../shared/widgets/yaha-box-sizes.dart';
import '../../shared/widgets/yaha-colors.dart';
import '../../shared/widgets/yaha-font-sizes.dart';
import '../../shared/widgets/yaha-space-sizes.dart';

class CommentWidget extends ConsumerWidget {
  final domain.Comment commentEntity;

  const CommentWidget({
    Key? key,
    required this.commentEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  child: Image.network(commentEntity.profilePicture),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commentEntity.ownerName,
                      style: const TextStyle(
                          fontSize: YahaFontSizes.small,
                          color: YahaColors.textColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: YahaSpaceSizes.xxSmall),
                      child: Text(
                        commentEntity.date,
                        style: const TextStyle(
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
                    const BoxConstraints(maxHeight: YahaBoxSizes.heightGeneral),
                child: Text(commentEntity.body),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
