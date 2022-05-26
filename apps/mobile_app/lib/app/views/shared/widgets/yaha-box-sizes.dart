class YahaBoxSizes {
  //HEIGHT - general
  static const heightXXXSmall = 50.0;
  static const heightXXSmall = 65.0;
  static const heightXSmall = 85.0;
  static const heightSmall = 120.0;
  static const heightGeneral = 160.0;
  static const heightMedium = 220.0;
  static const categoryTitleBoxHeight = 56.0;

  //WIDTH - general
  static const widthXXXSmall = 50.0;
  static const widthXXSmall = 65.0;
  static const widthXSmall = 85.0;
  static const widthSmall = 120.0;
  static const widthGeneral = 160.0;
  static const widthMedium = 220.0;

  //HEIGHT - button
  static const buttonHeight = 50.0;

  //WIDTH - button
  static const buttonWidthSmall = 200.0;
  static const buttonWidthBig = 300.0;

  //WIDTH - toggle
  static const toggleWidth = 145.0;

  //HEIGHT - back button
  static const backButtonHeight = 44.0;

  //WIDTH - back button
  static const backButtonWidth = 44.0;

  //WIDTH - hike outline boxes
  //Had to make them both 16 pixels wider than what's in the design because there was an overflow on the right according to the tests.
  //In reality the overflow was not seenable and the time and left arrow weren't even close to the edge of the box.
  static const checkpointWidthMax = 366.0;
  static const sectionWidthMax = 322.0;

  //HEIGHT - hike outline boxes
  static const checkpointHeight = 90.0;
  static const sectionHeight = 70.0;

  //HEIGHT - comment profile picture
  static const commentProfilePictureHeight = 60.0;

  //WIDTH - comment profile picture
  static const commentProfilePictureWidth = 60.0;

  //RADIUS - circle avatars
  static const circleAvatarRadiusSmall = 18.0;
  static const circleAvatarRadiusLarge = 32.0;

  //MAX WIDTH
  static const maxWidth400 = 400.0;

  const YahaBoxSizes();
}
