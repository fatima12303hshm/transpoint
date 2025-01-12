import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff4400EC);
  static const Color secondaryColor = Color(0xff2271E6);
  static const Color white = Color(0xffffffff);
  static const Color grey = Color(0xffd9d9d9);
  static const Color errorColor=Color(0xffB3261E);
  
  static const Color successColor = Color(0xff5FC249);

  static Color backgroundPrimaryOpacity(int opacity) =>
      const Color(0xff4400EC).withOpacity(opacity.toDouble() / 100);
  static Color tertiaryColorOpacity(int opacity) =>
      const Color(0xff2271E6).withOpacity(opacity.toDouble() / 100);

  static Color errorColorOpacity(int opacity) =>
      const Color(0xffB3261E).withOpacity(opacity.toDouble() / 100);

  static Color greyColorOpacity(int opacity) =>
      const Color(0xffC4C4C4).withOpacity(opacity.toDouble() / 100);

  static Color blackColorOpacity(int opacity) =>
      const Color(0xff000000).withOpacity(opacity.toDouble() / 100);
}
