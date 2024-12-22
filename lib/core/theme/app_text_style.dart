import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

sealed class AppTextStyle {
  const AppTextStyle._();

  static const w400S12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: "Raleway",
    color: AppColors.grey83,
    fontSize: 12,
  );

  static const w500S20 = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Raleway",
    color: AppColors.leadingColor,
    fontSize: 20,
  );
}
