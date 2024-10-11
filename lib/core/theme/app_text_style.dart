import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

sealed class AppTextStyle {
  const AppTextStyle._();

  static const w600H20 = TextStyle(
      fontSize: 20,
      fontFamily: "avenirnextcyr",
      color: AppColors.dark,
      fontWeight: FontWeight.w600);


  static const w600H18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: "avenirnextcyr-light",
    color: AppColors.dark,
  );
}
