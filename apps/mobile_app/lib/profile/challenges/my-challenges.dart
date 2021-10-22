import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/utility/challenge-box.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class MyChallenges extends ConsumerWidget {
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
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    primary: false,
                    crossAxisSpacing: YahaSpaceSizes.general,
                    mainAxisSpacing: YahaSpaceSizes.general,
                    children: [
                      ChallengeBox(
                        title: 'Walk 50km',
                        icon: 'assets/images/hiking_person.png',
                      ),
                      ChallengeBox(
                        title: 'Complete 10 hikes',
                        icon: 'assets/images/format_list_bulleted.png',
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
