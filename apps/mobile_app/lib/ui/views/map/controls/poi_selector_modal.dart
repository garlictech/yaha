import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/ui/views/poi/poi_icon_list.dart';

class PoiSelectorModal extends ConsumerWidget {
  final Hike hike;
  final VoidCallback onCloseTapped;
  const PoiSelectorModal(
      {super.key, required this.hike, required this.onCloseTapped});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onTapIcon(List<PoiType> types) {
      ref
          .read(hikingSettingsServiceProvider(hike.id).notifier)
          .setFilteredPois(types);
      onCloseTapped();
    }

    onResetPressed() {
      ref
          .read(hikingSettingsServiceProvider(hike.id).notifier)
          .resetFilteredPois();
      onCloseTapped();
    }

    onAllPressed() {
      ref
          .read(hikingSettingsServiceProvider(hike.id).notifier)
          .showAllPoisAlongHike(true);
      onCloseTapped();
    }

    return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Theme.of(context).primaryColor),
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(onPressed: onResetPressed, child: const Text("reset")),
            TextButton(onPressed: onAllPressed, child: const Text("all")),
            IconButton(
                onPressed: onCloseTapped,
                icon: const Icon(Icons.close),
                color: Theme.of(context).colorScheme.primary)
          ]),
          Expanded(child: Consumer(builder: (c, ref, child) {
            final pois = ref.watch(poisAlongHikeProvider(hike.id));
            return SingleChildScrollView(
                child: PoiIconList(
                    types: PoiUtils.uniqueTypes(pois),
                    hike: hike,
                    onTap: onTapIcon));
          }))
        ]));
  }
}
