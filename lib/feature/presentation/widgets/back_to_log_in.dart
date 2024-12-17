import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_locale_keys.dart';

class BackToLogIn extends StatelessWidget {
  const BackToLogIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, Routes.login);
      },
      splashColor: AppColors.mainColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.keyboard_backspace,
            color: AppColors.black54,
          ).paddingOnly(right: 5.w),
          Text(
            AppLocaleKeys.backToLogIn,
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
