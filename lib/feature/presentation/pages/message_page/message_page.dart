import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/core/theme/app_lotties.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';

import '../../../../core/theme/app_colors.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:2 ,
        shadowColor: AppColors.white,
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: FadeInUp(
          child: Text(
            AppLocaleKeys.message,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: AppColors.leadingColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),                                 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppLotties.noMessage,
              repeat: false,
              height: MediaQuery.of(context).size.height /3,
            ),
            FadeInUp(
              child: Text(                                        
                AppLocaleKeys.noMessage,
                style: Theme.of(context)                    
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 24.sp,),
              ),
            ).paddingOnly(bottom: 180.h),

          ],
        ),
      ),
    );
  }
}
