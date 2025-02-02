import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

class RentNowWidget extends StatelessWidget {
  const RentNowWidget({
    super.key,
    required this.cost,
  });

  final String? cost;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey83,
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BounceInLeft(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BounceInDown(
                  child: Text(
                    AppLocaleKeys.price,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 12.sp, color: AppColors.grey85),
                  ).paddingOnly(bottom: 8.h),
                ),
                BounceInUp(
                  child: Text(
                    cost ?? 'Rp. 2.500.000.000 / Year',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.leadingColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
          BounceInRight(
            child: InkWell(
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
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 15.h),
    );
  }
}
