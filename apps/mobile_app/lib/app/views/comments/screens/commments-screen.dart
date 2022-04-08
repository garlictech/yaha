import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/presenters/comments/comments-screen-presenter.dart';
import '../../shared/widgets/buttons/back-button.dart';
import '../../shared/widgets/yaha-border-radius.dart';
import '../../shared/widgets/yaha-box-sizes.dart';
import '../../shared/widgets/yaha-colors.dart';
import '../../shared/widgets/yaha-font-sizes.dart';
import '../../shared/widgets/yaha-icon-sizes.dart';
import '../../shared/widgets/yaha-space-sizes.dart';
import '../widgets/comment-widget.dart';

class CommmentsScreen extends ConsumerWidget {
  const CommmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(commentsScreenMVPProvider);
    final presenter = ref.watch(commentsScreenMVPProvider.notifier);

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
        leading: YahaBackButton(),
        actions: [
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.only(right: YahaSpaceSizes.medium),
              child: IconButton(
                icon: const Icon(Icons.add_rounded,
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
                        ...viewModel.comments.map(
                            (comment) => CommentWidget(commentEntity: comment)),
                        Visibility(
                          visible: viewModel.commentInputShown,
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
                                  child: TextField(
                                    controller: viewModel.newCommentController,
                                    cursorColor: YahaColors.textColor,
                                    maxLines: 10,
                                    decoration: const InputDecoration(
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
                                    onPressed: () {
                                      presenter.sendComment(
                                          body: viewModel
                                              .newCommentController.text);
                                    },
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
