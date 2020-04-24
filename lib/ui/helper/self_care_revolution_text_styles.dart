import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimen.dart';

class SCRTextStyles {
  static final TextStyle defaultButtonTextStyle = TextStyle(
      fontStyle: FontStyle.normal,
      color: AppColor.colorPrimary,
      fontWeight: FontWeight.w600,
      fontSize: AppDimen.TEXT_SIZE_16);

  static final TextStyle defaultButtonTextStyleWhite = TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: AppDimen.TEXT_SIZE_16);

  static final TextStyle buttonTextStyleWhite = TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: AppDimen.TEXT_SIZE_14);
}
