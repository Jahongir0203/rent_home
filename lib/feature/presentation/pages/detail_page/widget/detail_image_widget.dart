import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_png.dart';
import '../../../../../core/theme/app_svg.dart';
import '../../../widgets/app_widgets.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 304.h,
          width: 100.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
              image: AssetImage(AppPng.img3),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 34.r,
                  height: 34.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                        .withOpacity(0.7), // Semi-transparent grey background
                  ),
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: 20.r, color: AppColors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: 34.r,
                  height: 34.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                        .withOpacity(0.7), // Semi-transparent grey background
                  ),
                  child: IconButton(
                    icon: Icon(Icons.bookmark_border,
                        size: 20.r, color: AppColors.white),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            Text(
              "Dreamsville House",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ).paddingOnly(top: 137.h),
            Text(
              "Jl. Sultan Iskandar Muda, Jakarta selatan",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 12.sp, color: AppColors.colorD4),
            ).paddingOnly(top: 8.h, bottom: 20.h),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white.withOpacity(0.4),
                      ),
                      child: AppWidgets.imageSvg(
                          path: AppSvg.icBedLight, height: 16.r)
                          .paddingSymmetric(horizontal: 4.r, vertical: 5.r),
                    ).paddingOnly(right: 8.w),
                    Text(
                      '6',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 12.sp, color: AppColors.colorD4),
                    ).paddingOnly(right: 2.w),
                    Text(
                      'Bedroom',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 12.sp, color: AppColors.colorD4),
                    ),
                  ],
                ).paddingOnly(right: 19.w).paddingOnly(right: 32.w),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white.withOpacity(0.4),
                      ),
                      child: AppWidgets.imageSvg(
                          path: AppSvg.icBathLight, height: 16.r)
                          .paddingSymmetric(horizontal: 4.r, vertical: 5.r),
                    ).paddingOnly(right: 8.w),
                    Text(
                      '8',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 12.sp, color: AppColors.colorD4),
                    ).paddingOnly(right: 2.w),
                    Text(
                      'Bathroom',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 12.sp, color: AppColors.colorD4),
                    ),
                  ],
                ),
              ],
            )
          ],
        ).paddingOnly(left: 20.w, top: 20.h, right: 20.w),
      ],
    );
  }
}
