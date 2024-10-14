import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

sealed class AppTextStyle {
  const AppTextStyle._();

  static TextStyle w600H20 = TextStyle(
    fontSize: 20.sp,
    fontFamily: "Raleway",
    color: AppColors.dark,
    fontWeight: FontWeight.w600,
  );

  static TextStyle w600H18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: "Raleway",
    color: AppColors.dark,
  );
  static TextStyle w500H16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Raleway",
    color: AppColors.dark,
  );
  static TextStyle w400H10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Raleway",
    color: AppColors.dark,
  );
  static TextStyle w500H13 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Raleway",
    color: AppColors.dark,
  );
  static TextStyle w400H12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Raleway",
    color: AppColors.dark,
  );
}
