import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/feature/data/models/items_model.dart';
import 'package:rent_home/feature/presentation/pages/profile_page/widget/profile_body_widget.dart';
import 'package:rent_home/feature/presentation/pages/profile_page/widget/profile_user_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_locale_keys.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            AppLocaleKeys.profile,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: AppColors.black87,
                fontSize: 27.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          BounceInRight(
            child: PopupMenuButton(
              iconColor: AppColors.baseColor,
              icon: const Icon(
                Icons.more_vert,
              ),
              enabled: true,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    enabled: true,
                    child: BounceInUp(
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
                  ),
                  PopupMenuItem(
                    enabled: true,
                    child: BounceInDown(
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
                  ),
                ];
              },
            ),
          ),
        ],

      ),
      body: Column(
        children: [
          const ProfileUserWidget().paddingOnly(top: 10.h),
          ProfileCustomBodyWidget(
            items: items,
          ),
          SizedBox(
            height: 20.h,
          ),
          ProfileCustomBodyWidget(
            items: items1,
          ),
        ],
      ),
    );
  }
}


