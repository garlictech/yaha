import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/yaha-space-sizes.dart';
import '../widgets/event-box.dart';
import 'event-detail-screen.dart';

class OngoingEvents extends ConsumerWidget {
  const OngoingEvents({Key? key}) : super(key: key);

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
                    children: const [
                      EventBox(
                          background:
                              'packages/flutter_yaha_lib/assets/images/nagy-egedi-itura.png',
                          nextScreen: EventDetailScreen()),
                      EventBox(
                          background:
                              'packages/flutter_yaha_lib/assets/images/bukki-batyus-barangolas.png',
                          nextScreen: EventDetailScreen()),
                      EventBox(
                          background:
                              'packages/flutter_yaha_lib/assets/images/eger-csillaga.png',
                          nextScreen: EventDetailScreen()),
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
