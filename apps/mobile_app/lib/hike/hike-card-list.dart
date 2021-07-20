import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:yaha/hike/hike-card.dart';

class HikeCardList extends StatelessWidget {
  const HikeCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "",
      "",
      "",
      "",
    ];

    final data = [
      [Colors.red, 'Hike 1'],
      [Colors.cyan, 'Hike 2'],
      [Colors.blue, 'Hike 3'],
      [Colors.yellow, 'Hike 4']
    ];

    final images = data
        .map((e) => HikeCard(color: e[0] as Color, title: e[1] as String))
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: VerticalCardPager(
                titles: titles,
                images: images,
                align: ALIGN.CENTER,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
