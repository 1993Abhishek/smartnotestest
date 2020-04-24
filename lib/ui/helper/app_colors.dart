import 'package:flutter/material.dart';

class AppColor {
  //static final Color colorPrimary = hexToColor("#0C4884");
  static final Color colorSplashScreen = hexToColor("#2d23ba");
  static final Color colorSplashScreen2 = hexToColor("#01e7ff");
  static final Color colorSplashScreen3 = hexToColor("#070253");
  static final Color colorLoginScreen = hexToColor("#f3f5f9");
  static final Color colorLoginScreenText = hexToColor("#707070");
  static final Color colorLoginScreenButton = hexToColor("#2d23ba");
  static final Color colorLoginButtonText = hexToColor("#01e7ff");
  static final Color colorLoginButtonCircle = hexToColor("#130b84");
  static final Color colorLoginText1 = hexToColor("#354352");
  static final Color colorLoginText2 = hexToColor("#5468fe");
  static final Color colorHeadText1 = hexToColor("#18212a");
  static final Color colorHeadText2 = hexToColor("#707070");



  static final Color colorPrimary = hexToColor("#893caa");
  static final Color colorSecondary = hexToColor("#1870c9");
  static final Color colorBackground = hexToColor("#f5f5f5");
  static final Color colorHintText = hexToColor("#afb2b9");
  static final Color colorTextFieldUnderLine = hexToColor("#893caa");
  static final Color colorTextFieldUnderLine2 = hexToColor("#ccc9c9");
  static final Color colorTextFieldUnderLineActive = hexToColor("#4c0969");
  static final Color colorTextBoxColor = hexToColor("#458bd3");
  static final Color colorBackgroundLightGreen = hexToColor("#f2fff8");
  static final Color colorBackgroundLightRed = hexToColor("#fff3f2");
  static final Color colorBackgroundLightBlue = hexToColor("#e9e6ff");
  static final Color colorTextLabel = hexToColor("#b6b6b6");

  static final Color colorLoadingIndicator = hexToColor("#893caa");

  static final Color colorNotificationIcon = hexToColor("#e88623");
  static final Color colorNotificationCircle = hexToColor("#fcedde");
  static final Color colorNotificationText = hexToColor("#4a4a4a");

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
