import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';

import '../../../../../core/theme/app_colors.dart';

class NearFromYouWidget extends StatelessWidget {
  const NearFromYouWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocaleKeys.nearYou,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: AppColors.leadingColor),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppLocaleKeys.seeMore,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 12.sp, color: AppColors.grey83),
          ),
        ),
      ],
    );
  }
}
