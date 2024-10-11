import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      displayMedium:TextStyle(
        fontSize: 14,
        fontFamily: "avenirnextcyr-light",
        fontWeight: FontWeight.w400,
        color: AppColors.blue,
      ) ,
      displaySmall: TextStyle(
        fontSize: 14,
        fontFamily: "avenirnextcyr-light",
        fontWeight: FontWeight.w400,
        color: AppColors.dark70,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "avenirnextcyr-light",
        color: AppColors.dark,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "avenirnextcyr-light",
        color: AppColors.darkText,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "avenirnextcyr-light",
        color: AppColors.darkText,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "avenirnextcyr-light",
        color: AppColors.dark70,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkText),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.blue),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkText),
      ),
      contentPadding: EdgeInsets.zero,
      fillColor: AppColors.backgroundColor,
      suffixIconColor: AppColors.darkText,
      prefixIconColor: AppColors.dark,
      filled: true,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.blue, size: 20),
      backgroundColor: AppColors.backgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.mainColor,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light,
      ),
    ),
  );
}
