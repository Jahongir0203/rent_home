import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NotifacationIcon extends StatelessWidget {
  final VoidCallback onTap;
  const NotifacationIcon({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Stack(
        children: [
          ZoomTapAnimation(
            onTap: onTap,
            child: SvgPicture.asset(
              AppSvg.icNotifacation,
              height: 18.h,
              colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: SizedBox(
              height: 8.h,
              width: 8.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.cFA0E0E,
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
