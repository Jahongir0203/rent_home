import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_locale_keys.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: AppColors.white,
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: BounceInUp(
          child: Text(
            AppLocaleKeys.settings,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: AppColors.black87,
                fontSize: 27.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120.h,
          ),
          ZoomIn(
            child: SvgPicture.asset(AppSvg.icSettingsError,
              height: 230.h,
              width: 100.sw,
            ).paddingOnly(bottom: 20.h),
          ),
          BounceInUp(
            child: Text(
              AppLocaleKeys.customError,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors.black87,
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
