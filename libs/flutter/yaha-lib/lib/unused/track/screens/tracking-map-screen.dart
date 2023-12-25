import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackingMapScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {},
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
