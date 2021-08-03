import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:yaha/hike/hike-card.dart';

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
  ['Hike 1', 'Hike 1 subtitle', 220],
  ['Hike 2', 'Hike 2 subtitle', 220],
  ['Hike 3', 'Hike 3 subtitle', 220],
  ['Hike 4', 'Hike 4 subtitle', 220],
];

final images = data
    .map((e) => HikeCard(
          //color: e[0] as Color,
          title: e[0] as String,
          subTitle: e[1] as String,
          distanceFromCurrentLocation: e[2] as int,
        ))
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
                padding: EdgeInsets.all(20),
                child: VerticalCardPager(
                  titles: titles,
                  images: images,
                  align: ALIGN.CENTER,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
