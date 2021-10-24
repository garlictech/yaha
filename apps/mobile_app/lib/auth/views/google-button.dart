import 'package:yaha/auth/views/social-button.dart';
import 'package:yaha/utility/yaha-colors.dart';

class GoogleButton extends SocialButton {
  GoogleButton({required onPressed, required title})
      : super(
            onPressed: onPressed,
            title: title,
            iconPath: 'assets/images/btn_google_dark_normal_ios@3x.png',
            buttonColor: YahaColors.google);
}
