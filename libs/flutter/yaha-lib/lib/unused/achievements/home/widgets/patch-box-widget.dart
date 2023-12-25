import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

class PatchBoxWidget extends StatelessWidget {
  final String patchImage;

  const PatchBoxWidget({required this.patchImage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(YahaBorderRadius.general),
          color: YahaColors.accentColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              spreadRadius: 2.0,
              blurRadius: 6.0,
              offset: const Offset(3.0, 3.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(YahaSpaceSizes.general),
          child: Image.asset(patchImage),
        ),
      ),
    );
  }
}
