import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.onTap,
    required this.isSelectItem,
  });
  final VoidCallback onTap;
  final bool isSelectItem;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        alignment: Alignment.center,
        height: 34.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isSelectItem ? AppColors.linerGradient1 : AppColors.cF7F7F7,
              isSelectItem ? AppColors.linerGradient2 : AppColors.cF7F7F7,
            ],
          ),
        ),
        child: Text(
          "House",
          style: AppTextStyle.w500H13.copyWith(color: isSelectItem ? AppColors.white : AppColors.black),
        ),
      ),
    );
  }
}
