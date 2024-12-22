import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

InkWell SignUpHaveAnAccountWidget(BuildContext context,VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    splashColor: AppColors.mainColor.withOpacity(0.19),
    borderRadius: BorderRadius.circular(8.r),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
              text: AppLocaleKeys.haveAnAccount,
              style: Theme.of(context).textTheme.headlineSmall,
              children: [
                TextSpan(
                  text: AppLocaleKeys.logIn,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ]),
        ),
      ],
    ),
  );
}
