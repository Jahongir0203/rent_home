import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';
import '../../../bloc/home_bloc/home_bloc.dart';

class HomeIsFirstTimeWidget extends StatelessWidget {
  const HomeIsFirstTimeWidget({
    super.key,
    required this.bloc,
    required this.state,
  });

  final HomeBloc bloc;
  final HomeSuccessState state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bloc.add(HomeSuccessEvent(
            housesResponse: state.housesResponse,
            currentLocation: state.currentLocation,
            count: state.count,
            isFirstTime: false));
      },
      child: Container(
        height: 100.sh,
        width: 100.sw,
        color: AppColors.black54.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocaleKeys.introduction,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500),
            ).paddingOnly(bottom: 80.h),
            Icon(
              Icons.swipe_right,
              color: AppColors.white,
              size: 45.sp,
            ).paddingOnly(bottom: 50.h),
            Text(
              AppLocaleKeys.swipeRight,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ).paddingOnly(bottom: 100.h),
            TextButton(
              onPressed: () {
                bloc.add(HomeSuccessEvent(
                    housesResponse: state.housesResponse,
                    currentLocation: state.currentLocation,
                    count: state.count,
                    isFirstTime: false));
              },
              child: Text(
                AppLocaleKeys.continue2,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColors.white, fontSize: 20.sp),
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
