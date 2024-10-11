
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../core/theme/app_colors.dart';

Widget _baseText({
  required String text,
  double? fontSize,
  Color? color=AppColors.dark,
  FontWeight fontWeight = FontWeight.normal,
  int maxLines = 1,
  bool autoResize = false,
  TextAlign textAlign = TextAlign.start,
  bool richText = false,
  double height = 1,
  List<MarkerText> othersMarkers = const [],
}) {
  TextStyle textStyle = TextStyle(
    fontSize: fontSize ?? 16.sp,
    color: color ?? AppColors.darkText,
    fontWeight: fontWeight,
    height: height,
    fontFamily: "avenirnextcyr-light",

  );
  if (richText) {
    return SuperRichText(
      text: text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
       othersMarkers: othersMarkers,
    );
  }
  if (autoResize) {
    return AutoSizeText(
      text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
  return Text(
    text,
    textAlign: textAlign,
    style: textStyle,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

class AppWidgets {
  static Widget text({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    int maxLines = 1,
    bool autoResize = false,
    TextAlign textAlign = TextAlign.start,
    bool richText = false,
    List<MarkerText> othersMarkers = const [],
    double height = 1,
  }) {
    return _baseText(
      textAlign: textAlign,
      text: text,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      maxLines: maxLines,
      autoResize: autoResize,
      richText: richText,
      othersMarkers: othersMarkers,
      height: height,
    );
  }

  static Widget textLocale({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 1,
    bool autoResize = false,
    TextAlign textAlign = TextAlign.start,
    List<String> args = const [],
    bool richText = false,
    double height = 1.4,
    List<MarkerText> othersMarkers = const [],
  }) {
    return _baseText(
      textAlign: textAlign,
      text: tr(text, args: args),
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      maxLines: maxLines,
      autoResize: autoResize,
      richText: richText,
      othersMarkers: othersMarkers,
      height: height,
    );
  }

  static Widget imageAsset({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  // static AppBar appBar({
  //   required String title,
  //   Function? leadingTap,
  // }) {
  //   return AppBar(
  //     elevation: 2,
  //     backgroundColor: AppColors.backgroundColor,
  //     leading: IconButton(
  //       icon: AppWidgets.imageSvg(
  //         path: AppImageUtils.IC_ARROW_BACK,
  //         width: 20,
  //         height: 15,
  //       ),
  //       onPressed: () {
  //         leadingTap != null ? leadingTap() : NavigatorService.to.pop();
  //       },
  //     ),
  //     bottom: PreferredSize(
  //       preferredSize: Size(1.sw, 60.h),
  //       child: Row(
  //         children: [
  //           AppWidgets.textLocale(
  //             text: title,
  //             fontSize: 23.sp,
  //             color: AppColors.TEXT_BLUE,
  //             fontWeight: FontWeight.w700,
  //           ).paddingOnly(
  //             left: 20.w,
  //             bottom: 30.h,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  static Widget imageSvg({
    required String path,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
    Color? color,
  }) {
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static void showText({
    required String text,
    Duration? duration,
  }) {
    duration ??= const Duration(seconds: 2);
    BotToast.showText(
      text: text,
      textStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        color: Colors.white,
      ),
      align: Alignment.center,
      duration: duration,
    );
  }

  static Widget title16(String text, [Color? color]) {
    return AppWidgets.text(
      text: text,
      maxLines: 50,
      color: color,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      textAlign: TextAlign.center,
    );
  }

}
