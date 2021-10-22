import 'package:flutter/material.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';

class Challenges extends StatelessWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: YahaColors.background,
              title: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: YahaBackButton(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Challenges',
                      style: TextStyle(
                          color: YahaColors.textColor,
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              bottom: TabBar(
                labelColor: YahaColors.primary,
                unselectedLabelColor: YahaColors.textColor,
                indicatorColor: YahaColors.primary,
                tabs: [
                  Tab(text: 'All challenges'),
                  Tab(text: 'My challenges'),
                ],
              )),
        ),
      ),
    );
  }
}
