import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_locale_keys.dart';

class DescriptionTitleWidget extends StatelessWidget {
  const DescriptionTitleWidget({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocaleKeys.description,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: AppColors.leadingColor,
          ),
    );
  }
}
