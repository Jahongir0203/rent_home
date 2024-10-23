import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_png.dart';
import '../../../../../core/theme/app_svg.dart';
import '../../../widgets/app_widgets.dart';

class BestForYouImagesWidget extends StatelessWidget {
  const BestForYouImagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70.r,
              width: 74.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                  image: AssetImage(AppPng.img3),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Orchard House",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.leadingColor),
                ),
                Text(
                  "Rp.250.000.000/Year",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColors.mainColor, fontSize: 12.sp),
                ).paddingOnly(top: 8.h, bottom: 5.h),
                Row(
                  children: [
                    Row(
                      children: [
                        AppWidgets.imageSvg(path: AppSvg.icBedDark)
                            .paddingOnly(right: 8.w),
                        Text(
                          '6',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 12.sp, color: AppColors.grey85),
                        ).paddingOnly(right: 2.w),
                        Text(
                          'Bedroom',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 12.sp, color: AppColors.grey85),
                        ),
                      ],
                    ).paddingOnly(right: 19.w),
                    Row(
                      children: [
                        AppWidgets.imageSvg(path: AppSvg.icBathDark)
                            .paddingOnly(right: 8.w),
                        Text(
                          '8',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 12.sp, color: AppColors.grey85),
                        ).paddingOnly(right: 2.w),
                        Text(
                          'Bathroom',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 12.sp, color: AppColors.grey85),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ).paddingOnly(left: 20.w),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 24.h,
        );
      },
      itemCount: 10,
    );
  }
}
