import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DetailOnTabIconBotton extends StatelessWidget {
  const DetailOnTabIconBotton({
    super.key,
    required this.onTap,
    required this.iconName,
  });
  final VoidCallback onTap;
  final String iconName;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.h),
        height: 34.h,
        width: 34.w,
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(iconName),
      ),
    );
  }
}
