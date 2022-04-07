import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/profile/time-capsules/views/widgets/poi-with-image-widget.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/buttons/yaha-cta-big.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class LeaveATimeCapsuleScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    return Scaffold(
      backgroundColor: YahaColors.timeCapsuleBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Leave a TimeCapsule',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: YahaFontSizes.medium,
            color: YahaColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: YahaBackButton(),
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
                              top: YahaSpaceSizes.small,
                              bottom: YahaSpaceSizes.general),
                          child: PoiWithImageWidget(
                            backgroundColor: YahaColors.timeCapsule,
                            image: 'assets/images/timecapsule.png',
                            radius: 40,
                            padding: YahaSpaceSizes.small,
                          ),
                        ),
                        Text(
                          '1. Give your TimeCapsule a name',
                          style: TextStyle(
                              color: YahaColors.textColor,
                              fontSize: YahaFontSizes.small,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.medium,
                              bottom: YahaSpaceSizes.xLarge),
                          child: TextField(
                            autocorrect: true,
                            keyboardType: TextInputType.text,
                            minLines: 1,
                            maxLines: 2,
                            cursorColor: YahaColors.textColor,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: YahaColors.textColor,
                                fontSize: YahaFontSizes.small),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(YahaSpaceSizes.small),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                borderSide: BorderSide(
                                    color: YahaColors.textColor,
                                    width: YahaBorderWidth.xSmall),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                borderSide: BorderSide(
                                    color: YahaColors.primary,
                                    width: YahaBorderWidth.xSmall),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '2. Fill it with some content',
                          style: TextStyle(
                              color: YahaColors.textColor,
                              fontSize: YahaFontSizes.small,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.medium,
                              bottom: YahaSpaceSizes.xSmall),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Write a short text',
                              style: TextStyle(
                                  color: YahaColors.textColor,
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        TextField(
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          minLines: 1,
                          maxLines: 5,
                          cursorColor: YahaColors.textColor,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: YahaColors.textColor,
                              fontSize: YahaFontSizes.small),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.all(YahaSpaceSizes.small),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general),
                              borderSide: BorderSide(
                                  color: YahaColors.textColor,
                                  width: YahaBorderWidth.xSmall),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general),
                              borderSide: BorderSide(
                                  color: YahaColors.primary,
                                  width: YahaBorderWidth.xSmall),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.semiLarge,
                              bottom: YahaSpaceSizes.small),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Do you want to add some picture as well?',
                              style: TextStyle(
                                  color: YahaColors.textColor,
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: YahaBoxSizes.heightGeneral,
                              color: YahaColors.grey200,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.file_upload_rounded,
                                    size: YahaIconSizes.uploadIcon,
                                    color: YahaColors.accentColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xLarge,
                              bottom: YahaSpaceSizes.medium),
                          child: YahaCtaBig(
                            title: 'Leave a TimeCapsule',
                            titleColor: YahaColors.textColor,
                            backgroundColor: YahaColors.timeCapsule,
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
