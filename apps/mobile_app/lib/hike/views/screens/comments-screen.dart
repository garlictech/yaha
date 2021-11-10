import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class CommmentsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: Text(
          'Comments',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: YahaFontSizes.medium,
            color: YahaColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: YahaBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: YahaSpaceSizes.medium),
            child: IconButton(
              icon: Icon(Icons.add_outlined,
                  size: YahaIconSizes.large, color: YahaColors.textColor),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {},
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
