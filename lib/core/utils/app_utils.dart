import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

sealed class AppUtils {
  AppUtils._();


  /// SizedBox
  static const kSizedBoxW5 = SizedBox(width: 5);
  static const kSizedBoxH80 = SizedBox(height: 80,);

  ///Paddings
  static const kPaddingZero=EdgeInsets.zero;
  static const kPaddingHor20 = EdgeInsets.symmetric(horizontal: 20);
  static const kPaddingHor10Ver25 =
      EdgeInsets.symmetric(horizontal: 10, vertical: 25);

  /// Divider
    static const  kDivider = Divider(
    color: AppColors.otpColor,
  );
}
