import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/router/app_routes.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

class LogInHaveNotAccountWidget extends StatelessWidget {
  const LogInHaveNotAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          Routes.signUp,
        );
      },
      splashColor: AppColors.mainColor.withOpacity(0.19),
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BounceInUp(
            child: RichText(
              text: TextSpan(
                  text: AppLocaleKeys.registerYet,
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: [
                    TextSpan(
                      text: AppLocaleKeys.signUp,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
