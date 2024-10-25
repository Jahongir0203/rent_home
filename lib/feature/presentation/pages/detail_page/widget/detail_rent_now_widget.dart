import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

class RentNowWidget extends StatelessWidget {
  const RentNowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      color: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocaleKeys.price,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 12.sp, color: AppColors.grey85),
              ).paddingOnly(bottom: 8.h),
              Text(
                'Rp. 2.500.000.000 / Year',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.leadingColor,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 43.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.gradient1,
                    AppColors.gradient2,
                  ],
                ),
              ),
              child: Text(
                AppLocaleKeys.rentNow,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ).paddingSymmetric(horizontal: 24.w, vertical: 12.h),
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 15.h),
    );
  }
}
