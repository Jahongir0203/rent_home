import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.mainColor,
      expandedHeight: 180.0,
      floating: true,
      pinned: true,
      actions: [
        PopupMenuButton(
          iconColor: AppColors.white,
          icon: const Icon(
            Icons.more_vert,
          ),
          enabled: true,
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                enabled: true,
                child: Row(
                  children: [
                    Icon(Icons.edit,size: 14.r,
                      color: AppColors.cGRAY4 ,
                    ),
                    SizedBox(width: 8.w,),
                    Text(AppLocaleKeys.edit,
                      style:Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 16.r,
                          color: AppColors.cGRAY4,
                          fontWeight: FontWeight.w400
                      ) ,
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                enabled: true,
                child: Row(
                  children: [
                    Icon(Icons.share,size: 14.r,
                      color: AppColors.cGRAY4 ,
                    ),
                    SizedBox(width: 8.w,),
                    Text(AppLocaleKeys.share,
                      style:Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 16.r,
                          color: AppColors.cGRAY4,
                          fontWeight: FontWeight.w400
                      ) ,
                    ),
                  ],
                ),
              ),
            ];
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(bottom: 120.h),
        stretchModes: const [
          StretchMode.fadeTitle
        ],
        title: Text(
          AppLocaleKeys.profile,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: AppColors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),

        // background: Image.asset(
        //   AppPng.img4,
        //   fit: BoxFit.cover,
        //   errorBuilder: (context, error, stackTrace) =>
        //       const Center(child: Text('Failed to load image')),
        // ),
        centerTitle: true,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              const Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.grey83,
                    ),
                  ),
                  // Positioned(
                  //   right: -10.r,
                  //   bottom: -7.r,
                  //   child: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.add_circle,
                  //         color: AppColors.grey83.withOpacity(0.8),
                  //         size: 30.sp,
                  //       )),
                  // ),
                ],
              ).paddingOnly(right: 15.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jahongir Eshonqulov",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(
                        color: AppColors.white.withOpacity(0.8),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600),
                  ).paddingOnly(bottom: 8.h),
                  Text(
                    "jahongir@gmial.com",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ).paddingOnly(bottom: 15.h, left: 15.w, right: 15.w),
        ),
      ),
    );
  }
}
