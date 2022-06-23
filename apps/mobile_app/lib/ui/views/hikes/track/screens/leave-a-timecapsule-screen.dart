import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/time-capsules/widgets/poi-with-image-widget.dart';

import '../../../shared/shared.dart';

class LeaveATimeCapsuleScreen extends ConsumerWidget {
  const LeaveATimeCapsuleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: YahaColors.timeCapsuleBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Leave a TimeCapsule',
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
                              top: YahaSpaceSizes.small,
                              bottom: YahaSpaceSizes.general),
                          child: const PoiWithImageWidget(
                            backgroundColor: YahaColors.timeCapsule,
                            image: 'assets/images/timecapsule.png',
                            radius: 40,
                            padding: YahaSpaceSizes.small,
                          ),
                        ),
                        const Text(
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
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: YahaColors.textColor,
                                fontSize: YahaFontSizes.small),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.all(YahaSpaceSizes.small),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                borderSide: const BorderSide(
                                    color: YahaColors.textColor,
                                    width: YahaBorderWidth.xSmall),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                borderSide: const BorderSide(
                                    color: YahaColors.primary,
                                    width: YahaBorderWidth.xSmall),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          '2. Fill it with some content',
                          style: TextStyle(
                              color: YahaColors.textColor,
                              fontSize: YahaFontSizes.small,
                              fontWeight: FontWeight.w600),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
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
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: YahaColors.textColor,
                              fontSize: YahaFontSizes.small),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.all(YahaSpaceSizes.small),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general),
                              borderSide: const BorderSide(
                                  color: YahaColors.textColor,
                                  width: YahaBorderWidth.xSmall),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general),
                              borderSide: const BorderSide(
                                  color: YahaColors.primary,
                                  width: YahaBorderWidth.xSmall),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
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
                                children: const [
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
                          child: const YahaCtaBig(
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
