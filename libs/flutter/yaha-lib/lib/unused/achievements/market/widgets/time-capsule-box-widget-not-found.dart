import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';
import 'package:flutter_yaha_lib/ui/views/time-capsules/widgets/poi-with-image-widget.dart';

class TimeCapsuleBoxWidgetNotFound extends StatelessWidget {
  final double size;

  const TimeCapsuleBoxWidgetNotFound({required this.size, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Opacity(
        opacity: 0.65,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(YahaBorderRadius.general),
            color: YahaColors.timeCapsuleBackground,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                spreadRadius: 2.0,
                blurRadius: 6.0,
                offset: const Offset(3.0, 3.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PoiWithImageWidget(
                  backgroundColor: YahaColors.timeCapsule,
                  image:
                      'packages/flutter_yaha_lib/assets/images/timecapsule.png',
                  radius: size * 0.25,
                  padding: YahaSpaceSizes.small),
              Padding(
                padding: const EdgeInsets.only(
                    top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.xxxSmall),
                child: Text(
                  'TimeCapsule',
                  style: TextStyle(
                      color: YahaColors.textColor,
                      fontSize: size <= MediaQuery.of(context).size.width * 0.50
                          ? YahaFontSizes.xSmall
                          : YahaFontSizes.small,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "You haven't found this TimeCapsule yet",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: YahaColors.textColor,
                    fontSize: YahaFontSizes.xSmall,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
