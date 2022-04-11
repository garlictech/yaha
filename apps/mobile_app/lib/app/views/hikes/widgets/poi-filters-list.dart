import 'package:flutter/material.dart';

import '../../shared/shared.dart';

const List<Object> defaultPoiFiltersList = [];

class PoiFiltersList extends StatelessWidget {
  const PoiFiltersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*var nodes = defaultPoiFiltersList.map((node) {
      if (node is PoiFilters) {
        return PoiFilters(
          backgroundColor: node.backgroundColor,
          icon: node.icon,
          title: node.title,
        );
      } else {
        throw "Wrong data";
      }
    });
*/
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: YahaSpaceSizes.medium,
        runSpacing: YahaSpaceSizes.xSmall,
        alignment: WrapAlignment.start,
        //children: [...nodes],
      ),
    );
  }
}
