import 'package:flutter/material.dart';
import 'package:yaha/app/views/shared/shared.dart';
import 'package:yaha/app/views/time-capsules/widgets/poi-with-image-widget.dart';

class TimeCapsuleBoxWidgetNotFound extends StatelessWidget {
  const TimeCapsuleBoxWidgetNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Opacity(
        opacity: 0.65,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.43,
          height: MediaQuery.of(context).size.width * 0.43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(YahaBorderRadius.general),
            color: YahaColors.timeCapsuleBackground,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                spreadRadius: 2.0,
                blurRadius: 8.0,
                offset: const Offset(3.0, 3.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PoiWithImageWidget(
                  backgroundColor: YahaColors.timeCapsule,
                  image: 'assets/images/timecapsule.png',
                  radius: 42.0,
                  padding: YahaSpaceSizes.small),
              Padding(
                padding: const EdgeInsets.only(
                    top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.xSmall),
                child: Text(
                  'TimeCapsule',
                  style: TextStyle(
                      color: YahaColors.textColor,
                      fontSize: YahaFontSizes.xSmall,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                'You own this TimeCapsule',
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
