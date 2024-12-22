import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

class DescriptionTitleWidget extends StatelessWidget {
  const DescriptionTitleWidget({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Text(
        AppLocaleKeys.description,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: AppColors.leadingColor,
            ),
      ),
    );
  }
}
