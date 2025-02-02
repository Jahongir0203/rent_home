import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

class GalleryTitleWidget extends StatelessWidget {
  const GalleryTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BounceInLeft(
      child: Text(
        AppLocaleKeys.gallery,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: AppColors.leadingColor,
        ),
      ),
    );
  }
}
