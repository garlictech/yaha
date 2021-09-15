import 'package:flutter/material.dart';
import 'package:yaha/event-detail-page.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';

class EventBox extends StatefulWidget {
  final String background;

  const EventBox({
    Key? key,
    required this.background,
  }) : super(key: key);

  @override
  _EventBoxState createState() => _EventBoxState();
}

class _EventBoxState extends State<EventBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventDetailPage()));
      },
      child: Container(
        width: YahaBoxSizes.widthGeneral,
        //height: YahaBoxSizes.heightGeneral,
        decoration: BoxDecoration(
          border: Border.all(
            color: YahaColors.primary,
            width: YahaBorderWidth.medium,
          ),
          borderRadius: BorderRadius.circular(YahaBorderRadius.general),
          image: DecorationImage(
            image: AssetImage(widget.background),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
