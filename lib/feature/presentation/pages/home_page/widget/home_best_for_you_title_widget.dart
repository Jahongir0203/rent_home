import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

class BestForYouTitleWidget extends StatelessWidget {
  const BestForYouTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BounceInLeft(
          child: Text(
            AppLocaleKeys.bestForYou,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: AppColors.leadingColor),
          ),
        ),
        BounceInRight(
          child: TextButton(
            onPressed: () {},
            child: Text(
              AppLocaleKeys.seeMore,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 12.sp, color: AppColors.grey83),
            ),
          ),
        ),
      ],
    );
  }
}
