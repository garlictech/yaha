import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/profile/challenges/views/screens/challenge-detail-screen.dart';
import 'package:yaha/profile/challenges/views/widgets/challenge-box.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class AllChallenges extends ConsumerWidget {
  @override
  Widget build(BuildContext context,  WidgetRef ref) {
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
                        nextScreen: ChallengeDetailScreen(),
                      ),
                      ChallengeBox(
                        title: 'Walk 100km',
                        icon: 'assets/images/hiking_person.png',
                        nextScreen: ChallengeDetailScreen(),
                      ),
                      ChallengeBox(
                        title: 'Complete a hike at night',
                        icon: 'assets/images/half_moon.png',
                        nextScreen: ChallengeDetailScreen(),
                      ),
                      ChallengeBox(
                        title: 'Take 10 pictures during a hike',
                        icon: 'assets/images/photo_camera.png',
                        nextScreen: ChallengeDetailScreen(),
                      ),
                      ChallengeBox(
                        title: 'Complete 5 hikes',
                        icon: 'assets/images/format_list_bulleted.png',
                        nextScreen: ChallengeDetailScreen(),
                      ),
                      ChallengeBox(
                        title: 'Complete 10 hikes',
                        icon: 'assets/images/format_list_bulleted.png',
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
