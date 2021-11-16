import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/hike/views/widgets/list-section-title-box-widget.dart';
import 'package:yaha/profile/time-capsules/views/widgets/poi-with-image-widget.dart';
import 'package:yaha/utility/yaha-colors.dart';

class FoundTimeCapsulesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: [
                      ListSectionTitleBox(
                          title: 'November 2021',
                          backgroundColor: YahaColors.accentColor,
                          titleColor: YahaColors.textColor,
                          iconVisibility: false),
                      PoiWithImageWidget(
                        backgroundColor: YahaColors.amenity,
                        image: 'assets/images/timecapsule.png',
                      ),
                    ],
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
