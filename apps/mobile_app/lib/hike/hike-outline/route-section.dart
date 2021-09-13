import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

// We have to move these classes somewhere else
class RouteSectionModel {
  final String estimatedArrival;
  final String routeLength;

  const RouteSectionModel({
    required this.estimatedArrival,
    required this.routeLength,
  });
}

class RouteSection extends StatelessWidget {
  final RouteSectionModel routeSectionModel;

  const RouteSection({Key? key, required this.routeSectionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(YahaBorderRadius.general),
      child: Container(
        padding: EdgeInsets.all(YahaSpaceSizes.small),
        constraints: BoxConstraints(
          maxWidth: YahaBoxSizes.checkpointWidthMax,
        ),
        height: YahaBoxSizes.checkpointHeight,
        color: Colors.grey.withOpacity(0.2),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  routeSectionModel.estimatedArrival,
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_rounded))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  routeSectionModel.routeLength,
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_rounded))
              ],
            )
          ],
        ),
      ),
    );
  }
}
