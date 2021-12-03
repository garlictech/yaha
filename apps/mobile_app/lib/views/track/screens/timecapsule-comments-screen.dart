import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/presenters/track/timecapsule-comments-screen-presenter.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/views/track/widgets/timecapsule-comment-widget.dart';

class TimeCapsuleCommentsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(timeCapsuleCommentsScreenMVPProvider);
    final presenter = watch(timeCapsuleCommentsScreenMVPProvider.notifier);

    return Scaffold(
      backgroundColor: YahaColors.timeCapsuleBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                onPressed: () {
                  presenter.toggleCommentInput();
                },
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
                        ...viewModel.comments.map((comment) =>
                            TimeCapsuleCommentWidget(commentEntity: comment)),
                        Visibility(
                          visible: viewModel.commentInputShown,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      presenter.toggleCommentInput();
                                    },
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
                                    controller: viewModel.newCommentController,
                                    cursorColor: YahaColors.textColor,
                                    maxLines: 10,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: YahaColors.grey200,
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
                                      color: YahaColors.textColor,
                                      size: YahaFontSizes.large,
                                    ),
                                    onPressed: () {
                                      presenter.sendComment(
                                          body: viewModel
                                              .newCommentController.text);
                                    },
                                    label: Text(
                                      'Send',
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