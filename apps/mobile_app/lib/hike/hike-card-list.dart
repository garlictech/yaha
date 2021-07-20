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
      "",
      "",
    ];

    final List<Widget> images = [
      HikeCard(),
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.yellow,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.black,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.cyan,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.blue,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.grey,
        ),
      ),
    ];

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
