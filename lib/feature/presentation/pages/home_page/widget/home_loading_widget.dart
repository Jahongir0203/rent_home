import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../widgets/app_shimmer_container.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.sh,
      width: 100.sw,
      child: Shimmer.fromColors(
        baseColor: AppColors.baseColor.shade300,
        highlightColor: AppColors.highlightColor.shade100,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ShimmerContainer(h: 48.h, r: 10.r)
                      .paddingOnly(right: 8.w),
                ),
                ShimmerContainer(
                  h: 48.r,
                  w: 48.r,
                  r: 10.r,
                ),
              ],
            ).paddingOnly(bottom: 18.h, top: 22.h),
            SizedBox(
              height: 35.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ShimmerContainer(
                      h: 34.h,
                      w: 70.w,
                      r: 14.r,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 12.w,
                  ),
                  itemCount: 6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainer(
                  h: 19.h,
                  w: 110.w,
                  r: 5.r,
                ),
                ShimmerContainer(
                  h: 14.h,
                  w: 55.w,
                  r: 5.r,
                ),
              ],
            ).paddingOnly(top: 27.h, bottom: 24.h),
            SizedBox(
              height: 272.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ShimmerContainer(
                      h: 272.h,
                      w: 222.w,
                      r: 20.r,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 12.w,
                  ),
                  itemCount: 6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainer(
                  h: 19.h,
                  w: 110.w,
                  r: 5.r,
                ),
                ShimmerContainer(
                  h: 14.h,
                  w: 55.w,
                  r: 5.r,
                ),
              ],
            ).paddingOnly(top: 32.h, bottom: 24.h),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        ShimmerContainer(
                          h: 70.h,
                          w: 74.w,
                          r: 8,
                        ).paddingOnly(right: 20.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerContainer(
                              h: 19.h,
                              w: 107.w,
                            ),
                            ShimmerContainer(
                              h: 14.h,
                              w: 137.w,
                            ).paddingOnly(top: 8.h, bottom: 5.h),
                            ShimmerContainer(
                              h: 24.h,
                              w: 150.w,
                            ),
                          ],
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 24.h,
                  ),
                  itemCount: 6),
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
