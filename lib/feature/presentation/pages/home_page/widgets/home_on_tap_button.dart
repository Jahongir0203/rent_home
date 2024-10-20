import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeOnTapButton extends StatelessWidget {
  const HomeOnTapButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        height: double.infinity,
        width: 48.w,
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
        child: SvgPicture.asset(
          AppSvg.icTune,
        ),
      ),
    );
  }
}
