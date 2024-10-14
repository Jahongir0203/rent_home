import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_text_style.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.hintTextName,
    required this.icon,
    required this.inputType,
    required this.textController,
  });

  final TextEditingController textController;
  final String hintTextName;
  final TextInputType inputType;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      keyboardType: inputType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.cF7F7F7,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.cF7F7F7,
          ),
        ),
        hintText: hintTextName,
        hintStyle: AppTextStyle.w400H12.copyWith(color: AppColors.c858585),
        fillColor: AppColors.cF7F7F7,
        filled: true,
        prefixIcon: Padding(
          padding: EdgeInsets.all(14.w),
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(AppColors.c858585, BlendMode.srcIn),
          ),
        ),
      ),
      style: AppTextStyle.w500H13,
    );
  }
}
