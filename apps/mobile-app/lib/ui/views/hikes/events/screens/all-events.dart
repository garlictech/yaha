import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/event-box.dart';
import 'event-detail-screen.dart';
import '../../../shared/shared.dart';

class AllEvents extends ConsumerWidget {
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
                          background: 'assets/images/nagy-egedi-itura.png',
                          nextScreen: EventDetailScreen()),
                      EventBox(
                          background:
                              'assets/images/bukki-batyus-barangolas.png',
                          nextScreen: EventDetailScreen()),
                      EventBox(
                          background: 'assets/images/nagy-egedi-tura-kupa.png',
                          nextScreen: EventDetailScreen()),
                      EventBox(
                          background: 'assets/images/bukk-instant-kupa.png',
                          nextScreen: EventDetailScreen()),
                      EventBox(
                          background: 'assets/images/bukki-kihivas.png',
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
