import '../../shared/shared.dart';
import 'social-button.dart';

class FacebookButton extends SocialButton {
  const FacebookButton({required onPressed, required title})
      : super(
            onPressed: onPressed,
            title: title,
            iconPath: 'assets/images/facebook_logo@3x.png',
            buttonColor: YahaColors.facebook,
            iconSize: YahaIconSizes.medium,
            leftPadding: YahaSpaceSizes.xSmall);
}
