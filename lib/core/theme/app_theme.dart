import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 14,
        fontFamily: "Raleway",
        fontWeight: FontWeight.w400,
        color: AppColors.blue,
      ),
      displaySmall: TextStyle(
        fontSize: 14,
        fontFamily: "Raleway",
        fontWeight: FontWeight.w400,
        color: AppColors.dark70,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "Raleway",
        color: AppColors.dark,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Raleway",
        color: AppColors.darkText,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "Raleway",
        color: AppColors.darkText,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "Raleway",
        color: AppColors.dark70,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.cF7F7F7),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.cF7F7F7),
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
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
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
