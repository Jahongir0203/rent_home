
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/app_colors.dart';

class CategoryPartWidget extends StatelessWidget {
  const CategoryPartWidget({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            splashColor: AppColors.grey83.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10.r),
            child: Ink(
                height: 34.h,
                decoration: BoxDecoration(
                  color: selectedIndex == index ? null : AppColors.fillColor,
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: selectedIndex == index
                      ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.gradient1,
                      AppColors.gradient2,
                    ],
                  )
                      : null,
                ),
                child: Text(
                  listCategory[index],
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: selectedIndex == index
                          ? AppColors.white
                          : AppColors.grey85,
                      fontSize: 12.sp),
                ).paddingSymmetric(horizontal: 16.w, vertical: 10.h)),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 12.w,
          );
        },
      ),
    );
  }
}
