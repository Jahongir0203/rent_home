import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_text_style.dart';

class NearFromItemTitle extends StatelessWidget {
  const NearFromItemTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10.h,
      left: 20.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dreamsville House",
            style: AppTextStyle.w500H16.copyWith(color: AppColors.white),
          ),
          Text(
            "Jl. Sultan Iskandar Muda",
            style: AppTextStyle.w400H12.copyWith(color: AppColors.cD7D7D7),
          ),
        ],
      ),
    );
  }
}
