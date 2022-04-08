import 'package:flutter/material.dart';
import 'package:yaha/domain/domain.dart';

import 'hike-card.dart';

class HikeCardList extends StatefulWidget {
  @override
  _HikeCardListState createState() => _HikeCardListState();
  const HikeCardList({Key? key}) : super(key: key);
}

final List<String> titles = [
  "",
  "",
  "",
  "",
];

final data = [
  ['Hike 1', 'Hike 1 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 2', 'Hike 2 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 3', 'Hike 3 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 4', 'Hike 4 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 5', 'Hike 1 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 6', 'Hike 2 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 7', 'Hike 3 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 8', 'Hike 4 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 9', 'Hike 1 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 10', 'Hike 2 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 11', 'Hike 3 subtitle', 220, 'assets/images/Parlament.jpg'],
  ['Hike 12', 'Hike 4 subtitle', 220, 'assets/images/Parlament.jpg'],
];

final images = data
    .map((e) => HikeCard(
        hike: Hike(
            id: 'id',
            description: [
              TextualDescription(
                  languageKey: 'hu_hu',
                  title: e[0] as String,
                  summary: e[1] as String,
                  type: 'markdown')
            ],
            route: LineStringData(type: "Line", coordinates: const [
              [0.0, 0.0]
            ]))))
    .toList();

class _HikeCardListState extends State<HikeCardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListWheelScrollView(
                    itemExtent: 300,
                    children: images,
                    diameterRatio: 3,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
