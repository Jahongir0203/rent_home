import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_svg.dart';
import 'package:rent_home/core/theme/app_text_style.dart';

class HomeSearchItem extends StatelessWidget {
  const HomeSearchItem({
    super.key,
    required this.onChangeValue,
  });
  final ValueChanged<String> onChangeValue;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChangeValue,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.cF7F7F7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.cF7F7F7),
        ),
        hintText: "Search address, or near you ",
        hintStyle: AppTextStyle.w400H12.copyWith(color: AppColors.c858585),
        fillColor: AppColors.cF7F7F7,
        filled: true,
        prefixIcon: SvgPicture.asset(AppSvg.icSearch).paddingAll(12.w),
      ),
      style: AppTextStyle.w400H12,
    );
  }
}
