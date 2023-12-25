import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/ui/views/shared/widgets/yaha-space-sizes.dart';

import '../widgets/challenge-box.dart';
import 'challenge-detail-screen.dart';

class MyChallenges extends ConsumerWidget {
  const MyChallenges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
                        icon:
                            'packages/flutter_yaha_lib/assets/images/hiking_person.png',
                        nextScreen: ChallengeDetailScreen(),
                      ),
                      ChallengeBox(
                        title: 'Complete 10 hikes',
                        icon:
                            'packages/flutter_yaha_lib/assets/images/format_list_bulleted.png',
                        nextScreen: ChallengeDetailScreen(),
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
