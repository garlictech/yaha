import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/profile/events/views/screens/event-detail-screen.dart';
import 'package:yaha/profile/events/views/widgets/event-box.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class OngoingEvents extends ConsumerWidget {
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
                      EventBox(
                          background: 'assets/images/nagy-egedi-itura.png',
                          nextScreen: EventDetailScreen()),
                      EventBox(
                          background:
                              'assets/images/bukki-batyus-barangolas.png',
                          nextScreen: EventDetailScreen()),
                      EventBox(
                          background: 'assets/images/eger-csillaga.png',
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
