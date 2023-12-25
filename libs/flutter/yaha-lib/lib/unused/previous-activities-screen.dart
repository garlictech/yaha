import 'package:flutter/material.dart';

import '../ui/shared/shared.dart';
import '../ui/views/hike/widgets/hike-card-list.dart';

class PreviousActivitiesScreen extends StatefulWidget {
  const PreviousActivitiesScreen({Key? key}) : super(key: key);

  @override
  _PreviousActivitiesState createState() => _PreviousActivitiesState();
}

class _PreviousActivitiesState extends State<PreviousActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: YahaSpaceSizes.general,
                          top: YahaSpaceSizes.small,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              iconSize: YahaFontSizes.xxLarge,
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: YahaColors.textColor,
                              ),
                              onPressed: () {},
                            ),
                            const Text(
                              'Previous activities',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.large,
                                  fontWeight: FontWeight.w600,
                                  color: YahaColors.textColor),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'packages/flutter_yaha_lib/assets/images/filter-icon.png',
                                width: 28.0,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        //height: MediaQuery.of(context).size.height,
                        height: 800,
                        child: HikeCardList(),
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
