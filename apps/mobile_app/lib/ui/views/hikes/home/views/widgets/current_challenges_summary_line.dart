import 'package:flutter/material.dart';
import 'package:yaha/ui/views/personal/screen/challenge-detail-screen.dart';
import 'package:yaha/ui/views/personal/screen/challenges.dart';
import 'package:yaha/ui/views/personal/widgets/challenge-box.dart';

import '../../../../shared/shared.dart';

class CurrentChallengesSummaryLine extends StatelessWidget {
  const CurrentChallengesSummaryLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Current challenges',
            style: TextStyle(
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600,
                color: YahaColors.textColor),
          ),
        ),
        SizedBox(
          height: YahaBoxSizes.heightGeneral,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                padding: const EdgeInsets.only(right: YahaSpaceSizes.general),
                child: ChallengeBox(
                  title: 'Complete a hike at night',
                  icon: 'assets/images/half_moon.png',
                  nextScreen: ChallengeDetailScreen(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: YahaSpaceSizes.general),
                child: ChallengeBox(
                  title: 'Take 10 pictures during a hike',
                  icon: 'assets/images/photo_camera.png',
                  nextScreen: ChallengeDetailScreen(),
                ),
              ),
              ChallengeBox(
                title: 'Complete a hike at night',
                icon: 'assets/images/half_moon.png',
                nextScreen: ChallengeDetailScreen(),
              ),
            ],
          ),
        ),
        const ShowMoreButton(nextScreen: Challenges()),
      ],
    );
  }
}
