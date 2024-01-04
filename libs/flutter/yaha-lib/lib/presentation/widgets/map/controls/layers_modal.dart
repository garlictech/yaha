import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../../theme.dart';
import '../leaflet_map_widgets.dart';

class LayersModalListElement extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final bool selected;
  final bool optionalSelected;

  const LayersModalListElement(
      {super.key,
      required this.onTap,
      required this.label,
      required this.selected,
      this.optionalSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Row(children: [
          if (optionalSelected)
            Icon(Icons.check_sharp,
                color: Theme.of(context).colorScheme.primary),
          Text(label,
              style: TextStyles.mapOverlayTextStyles(context).copyWith(
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal))
        ]));
  }
}

class LayersModal extends StatelessWidget {
  final void Function(TileLayer) onLayerSelected;
  final void Function(TileLayer) onLayerAdded;
  final TileLayer? currentlySelected;
  final List<TileLayer> currentlyAdded;

  const LayersModal(
      {super.key,
      required this.onLayerSelected,
      this.currentlySelected,
      required this.onLayerAdded,
      this.currentlyAdded = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Theme.of(context).primaryColor),
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: FittedBox(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          LayersModalListElement(
              selected: currentlySelected == osmTileLayer,
              label: 'OSM',
              onTap: () => onLayerSelected(osmTileLayer)),
          LayersModalListElement(
              selected: currentlySelected == googleSatelliteTileLayer,
              label: 'Satellite',
              onTap: () => onLayerSelected(googleSatelliteTileLayer)),
          LayersModalListElement(
              selected: currentlySelected == topoTileLayer,
              label: 'Topographic',
              onTap: () => onLayerSelected(topoTileLayer)),
          const Divider(),
          LayersModalListElement(
              selected: currentlyAdded.contains(waymarkedTrails),
              label: 'Hiking trails',
              onTap: () => onLayerAdded(waymarkedTrails)),
        ])));
  }
}
