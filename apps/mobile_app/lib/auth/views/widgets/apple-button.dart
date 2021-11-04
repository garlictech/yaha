import 'package:yaha/utility/yaha-icon-sizes.dart';

import 'social-button.dart';
import 'package:yaha/utility/yaha-colors.dart';

class AppleButton extends SocialButton {
  AppleButton({required onPressed, required title})
      : super(
            onPressed: onPressed,
            title: title,
            iconPath: 'assets/images/apple_logo@3x.png',
            buttonColor: YahaColors.apple,
            iconSize: YahaIconSizes.medium,
            leftPadding: 7.0);
}
