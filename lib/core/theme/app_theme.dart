import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.white,
        fontSize: 20.sp,
        fontFamily: "Raleway",
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w900,
        color: AppColors.mainColor,
        fontSize: 70.sp,
        fontFamily: "Raleway",
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.black54,
        fontSize: 18.sp,
        fontFamily: "Raleway",
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.black54,
        fontSize: 15.sp,
        fontFamily: "Raleway",
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.mainColor,
        fontSize: 16.sp,
        fontFamily: "Raleway",
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.black87,
        fontSize: 40.sp,
        fontFamily: "Raleway",
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        color: Colors.white,
        fontFamily: "Raleway",
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      focusColor: AppColors.mainColor,
      fillColor: AppColors.white,
      errorStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.red,
        fontSize: 16.sp,
        fontFamily: "Raleway",
      ),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.black54,
        fontSize: 16.sp,
        fontFamily: "Raleway",
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black54),
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.mainColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black54),
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
    ),
  );
}
