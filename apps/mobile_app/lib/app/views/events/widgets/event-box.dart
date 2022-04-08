import 'package:flutter/material.dart';

import '../../shared/widgets/yaha-border-radius.dart';
import '../../shared/widgets/yaha-border-width.dart';
import '../../shared/widgets/yaha-colors.dart';

class EventBox extends StatefulWidget {
  final String background;
  final double? height;
  final double? width;
  final Widget nextScreen;

  const EventBox({
    Key? key,
    required this.background,
    this.height,
    this.width,
    required this.nextScreen,
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
            MaterialPageRoute(builder: (context) => widget.nextScreen));
      },
      child: Container(
        width: widget.width,
        height: widget.height,
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
