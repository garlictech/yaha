import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/profile/events/event-detail-page.dart';
import 'package:yaha/utility/event-box.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class AllEvents extends ConsumerWidget {
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
                          nextScreen: EventDetailPage()),
                      EventBox(
                          background:
                              'assets/images/bukki-batyus-barangolas.png',
                          nextScreen: EventDetailPage()),
                      EventBox(
                          background: 'assets/images/nagy-egedi-tura-kupa.png',
                          nextScreen: EventDetailPage()),
                      EventBox(
                          background: 'assets/images/bukk-instant-kupa.png',
                          nextScreen: EventDetailPage()),
                      EventBox(
                          background: 'assets/images/bukki-kihivas.png',
                          nextScreen: EventDetailPage()),
                      EventBox(
                          background: 'assets/images/eger-csillaga.png',
                          nextScreen: EventDetailPage()),
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
