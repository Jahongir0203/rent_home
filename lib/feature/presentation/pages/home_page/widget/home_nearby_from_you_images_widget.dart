import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_png.dart';

class NearFromYouImagesWidget extends StatelessWidget {
  const NearFromYouImagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 272.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.detail);
            },
            borderRadius: BorderRadius.circular(20.r),
            child: Ink(
              height: 272.h,
              width: 222.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: const DecorationImage(
                          image: AssetImage(AppPng.img3), fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: AppColors.leadingColor.withOpacity(0.24),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.white,
                              size: 10.r,
                            ).paddingOnly(right: 2.w),
                            Text(
                              "1.8 km",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: AppColors.white, fontSize: 12.sp),
                            )
                          ],
                        ).paddingSymmetric(horizontal: 3.w),
                      ).paddingOnly(top: 20.h, left: 140.w, right: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dreamville House",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            "JL. Sulan Iskandar Muda",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 12.sp, color: AppColors.colorD7),
                          ),
                        ],
                      ).paddingOnly(left: 20.w, bottom: 16.h)
                    ],
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 24.w,
          );
        },
      ),
    );
  }
}
