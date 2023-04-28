import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/ui/views/map/places_on_route_map_controller.dart';
import 'package:yaha/ui/views/poi/poi_icon_list.dart';

class PoiSelectorModal extends ConsumerWidget {
  final String hikeId;
  const PoiSelectorModal({super.key, required this.hikeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onCloseTapped() {
      ref
          .read(placesOnRouteMapControllerProvider(hikeId).notifier)
          .onPoiFilterCloseTapped();
    }

    onTapIcon(List<PoiType> types) {
      ref
          .read(hikingSettingsServiceProvider(hikeId).notifier)
          .setFilteredPois(types);

      onCloseTapped();
    }

    onResetPressed() {
      ref
          .read(hikingSettingsServiceProvider(hikeId).notifier)
          .resetFilteredPois();
      onCloseTapped();
    }

    onAllPressed() {
      ref
          .read(hikingSettingsServiceProvider(hikeId).notifier)
          .showAllPoisAlongHike(true);
      onCloseTapped();
    }

    final hike = ref.watch(placesOnRouteMapControllerProvider(hikeId)
        .select((value) => value.hike));

    return hike == null
        ? Container()
        : Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 3, color: Theme.of(context).primaryColor),
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                    onPressed: onResetPressed, child: const Text("reset")),
                TextButton(onPressed: onAllPressed, child: const Text("all")),
                IconButton(
                    onPressed: onCloseTapped,
                    icon: const Icon(Icons.close),
                    color: Theme.of(context).colorScheme.primary)
              ]),
              Expanded(child: Consumer(builder: (c, ref, child) {
                final pois =
                    ref.watch(poisAlongHikeProvider(hikeId)).data ?? [];
                return SingleChildScrollView(
                    child: PoiIconList(
                        types: PoiUtils.uniqueTypes(pois),
                        hike: hike,
                        onTap: onTapIcon));
              }))
            ]));
  }
}
