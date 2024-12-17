import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';

class ProfileUserWidget extends StatelessWidget {
  const ProfileUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BounceInLeft(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cGRAY2, width: 1.6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0.1),
            ),
          ],
          borderRadius: BorderRadius.circular(12.w),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            ZoomIn(
              child: Container(
                height: 70.r,
                width: 70.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.r),
                  color: AppColors.baseColor.shade100,
                ),
                child: Icon(
                  Icons.person,
                  size: 40.r,
                  color: AppColors.baseColor,
                ),
              ).paddingOnly(left: 10.w, right: 20.w),
            ),
            BounceInRight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BounceInRight(
                    child: Text(
                      "Jahongir Eshonqulov",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: AppColors.black87,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  BounceInRight(
                    child: Text(
                      "+99893 083 64 60",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: AppColors.baseColor.shade800,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
