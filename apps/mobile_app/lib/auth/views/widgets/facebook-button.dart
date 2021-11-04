import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

import 'social-button.dart';
import 'package:yaha/utility/yaha-colors.dart';

class FacebookButton extends SocialButton {
  FacebookButton({required onPressed, required title})
      : super(
            onPressed: onPressed,
            title: title,
            iconPath: 'assets/images/facebook_logo@3x.png',
            buttonColor: YahaColors.facebook,
            iconSize: YahaIconSizes.medium,
            leftPadding: YahaSpaceSizes.xSmall);
}
