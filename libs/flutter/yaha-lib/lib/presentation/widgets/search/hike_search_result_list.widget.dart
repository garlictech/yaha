import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/presentation/widgets/hikes/hike_card.dart';

class HikeSearchResultList extends StatelessWidget {
  final List<TrackEntity> tracks;

  const HikeSearchResultList({
    super.key,
    required this.tracks,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
        itemExtent: 230,
        children: tracks
            .map((hit) => Container(
                padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                child:
                    HikeCard(hikeId: hit.id, distanceFromCurrentLocation: 2)))
            .toList());
  }
}
