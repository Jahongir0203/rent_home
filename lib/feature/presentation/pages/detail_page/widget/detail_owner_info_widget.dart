import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_svg.dart';
import '../../../widgets/app_widgets.dart';

class OwnerInfoWidget extends StatelessWidget {
  const OwnerInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.grey83,
          radius: 20.r,
          child: const Icon(
            Icons.person,
            color: AppColors.white,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Garrey Allen",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColors.leadingColor),
            ).paddingOnly(bottom: 4.h),
            Text(
              "Owner",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColors.grey85, fontSize: 12.sp),
            ),
          ],
        ).paddingOnly(left: 16.w),
        OwnerContactInfo(
          onTap: () {},
          svg: AppSvg.icPhoneLight,
        ).paddingOnly(left: 122.w, right: 16.w),
        OwnerContactInfo(
          onTap: () {},
          svg: AppSvg.icMessage,
        ),
      ],
    );
  }
}


class OwnerContactInfo extends StatelessWidget {
  const OwnerContactInfo({
    super.key,
    required this.onTap,
    required this.svg,
  });

  final VoidCallback onTap;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5.r),
      child: Container(
        height: 28.r,
        width: 28.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.gradient2.withOpacity(0.7),
        ),
        child: AppWidgets.imageSvg(path: svg).paddingAll(6.r),
      ),
    );
  }
}
