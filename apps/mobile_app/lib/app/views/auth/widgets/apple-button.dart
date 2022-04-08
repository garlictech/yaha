import '../../shared/shared.dart';
import 'social-button.dart';

class AppleButton extends SocialButton {
  const AppleButton({required onPressed, required title})
      : super(
            onPressed: onPressed,
            title: title,
            iconPath: 'assets/images/apple_logo@3x.png',
            buttonColor: YahaColors.apple,
            iconSize: YahaIconSizes.medium,
            leftPadding: 7.0);
}
