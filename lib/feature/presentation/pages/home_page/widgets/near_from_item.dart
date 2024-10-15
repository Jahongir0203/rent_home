import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_svg.dart';
import 'package:rent_home/core/theme/app_text_style.dart';

class NearFromItem extends StatelessWidget {
  const NearFromItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: height * 0.3,
      width: width * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.blue,
        image: const DecorationImage(
          image: NetworkImage("https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=pexels-binyaminmellish-186077.jpg&fm=jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: AppColors.black.withOpacity(0.24),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppSvg.icNearby,
                      height: 10.h,
                    ),
                    10.getW(),
                    Text(
                      "1.8 km",
                      style: AppTextStyle.w400H12.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ).paddingOnly(top: 10.h, right: 10.r),
            ],
          ),
        ],
      ),
    );
  }
}
