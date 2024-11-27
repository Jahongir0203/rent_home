import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_png.dart';
import '../../../../../core/theme/app_svg.dart';
import '../../../../data/models/house/get_houses_response.dart';
import '../../../widgets/app_widgets.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({
    super.key,
    required this.house,
  });

  final House house;

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
              image: NetworkImage(
                  "https://static.vecteezy.com/system/resources/thumbnails/023/308/330/small_2x/ai-generative-exterior-of-modern-luxury-house-with-garden-and-beautiful-sky-photo.jpg"),
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
              house.address ?? "Tashkent",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ).paddingOnly(top: 137.h),
            Text(
              "${house.squareFootage ?? 40} м²",
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
                      '${house.bedrooms ?? 6}',
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
                      '${house.bathrooms ?? 2}',
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
