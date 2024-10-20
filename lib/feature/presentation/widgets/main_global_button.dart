import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainGlobalButton extends StatelessWidget {
  const MainGlobalButton({
    super.key,
    this.onTap,
    required this.title,
    required this.high,
  });

  final Function()? onTap;
  final String title;
  final double high;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: high,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.linerGradient1,
              AppColors.linerGradient2,
            ],
          ),
        ),
        child: Text(
          title,
          style: AppTextStyle.w500H16.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
