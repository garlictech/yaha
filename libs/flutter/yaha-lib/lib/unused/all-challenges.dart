import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/ui/views/shared/widgets/yaha-space-sizes.dart';

import '../widgets/challenge-box.dart';
import 'challenge-detail-screen.dart';

class AllChallenges extends ConsumerWidget {
  const AllChallenges({Key? key}) : super(key: key);

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
                        title: 'Walk 100km',
                        icon:
                            'packages/flutter_yaha_lib/assets/images/hiking_person.png',
                        nextScreen: ChallengeDetailScreen(),
                      ),
                      ChallengeBox(
                        title: 'Complete a hike at night',
                        icon:
                            'packages/flutter_yaha_lib/assets/images/half_moon.png',
                        nextScreen: ChallengeDetailScreen(),
                      ),
                      ChallengeBox(
                        title: 'Take 10 pictures during a hike',
                        icon:
                            'packages/flutter_yaha_lib/assets/images/photo_camera.png',
                        nextScreen: ChallengeDetailScreen(),
                      ),
                      ChallengeBox(
                        title: 'Complete 5 hikes',
                        icon:
                            'packages/flutter_yaha_lib/assets/images/format_list_bulleted.png',
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
