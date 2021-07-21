import 'package:flutter/material.dart';
import 'package:yaha/yaha-border-radius.dart';

class HikeCard extends StatelessWidget {
  //final Color color;
  final String title;
  final String subTitle;
  final int distanceFromCurrentLocation;

  const HikeCard({
    Key? key,
    //required this.color,
    required this.title,
    required this.subTitle,
    required this.distanceFromCurrentLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(YahaBorderRadius.poiSmall),
        child: Container(
          //color: color,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Parlament.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Align(child: Text(title)),
              Text(subTitle),
              Text('$distanceFromCurrentLocation km away'),
            ],
          ),
        ),
      ),
    );
  }
}
