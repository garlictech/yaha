import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import '../widgets/map/map.dart';
import '../widgets/shared/shared.dart';

class PlacesOnRouteScreen extends ConsumerWidget {
  final HikeEntity hike;

  const PlacesOnRouteScreen({super.key, required this.hike});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            leading: const YahaBackButton(),
            backgroundColor: Colors.black.withOpacity(0.3),
            elevation: 0,
            centerTitle: true,
            title: Padding(
                padding: const EdgeInsets.only(right: 45.0),
                child: YahaScreenHeadTitleText(
                    text: hike.title, color: Colors.white))),
        extendBodyBehindAppBar: true,
        body: PoisOfHikeMap(key: UniqueKey(), hike: hike));
  }
}
