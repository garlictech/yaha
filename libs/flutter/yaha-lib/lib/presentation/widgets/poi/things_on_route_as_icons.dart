import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';
import 'poi_icon_list.dart';
import 'things_on_route_as_icons.controller.dart';

class ThingsOnRouteAsIcons extends ConsumerWidget {
  final HikeEntity hike;
  const ThingsOnRouteAsIcons({super.key, required this.hike});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(thingsOnRouteAsIconsControllerProvider(hike.id)).isLoading;

    final controller =
        ref.read(thingsOnRouteAsIconsControllerProvider(hike.id).notifier);

    return isLoading
        ? const CircularProgressIndicator()
        : PoiIconList(
            onTap: (x) => controller.onPoiIconTapped(x, context),
            hike: controller.hike,
            types: controller.poiTypes);
  }
}
