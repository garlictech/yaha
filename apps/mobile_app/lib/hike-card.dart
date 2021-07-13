import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class HikeCard extends StatelessWidget {
  const HikeCard({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "RED",
      "YELLOW",
      "BLACK",
      "CYAN",
      "BLUE",
      "GREY",
    ];

    final List<Widget> images = [
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.red,
        ),
      ),
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
                align : ALIGN.CENTER
              ),
            ),
          ],
        ),
      ),
    );
  }
}
