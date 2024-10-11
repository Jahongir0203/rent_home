import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import 'app_widgets.dart';

class OtpAppBarWidget extends StatelessWidget {
  const OtpAppBarWidget({
    super.key,
    this.title,
    this.actionsTxt,
    this.onTap,
  });

  final String? title;
  final String? actionsTxt;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: Theme.of(context).appBarTheme.elevation,
      centerTitle: Theme.of(context).appBarTheme.centerTitle,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.blue,
          size: 14.h,
        ),
      ),
      title: title != null
          ? AppWidgets.textLocale(
        text: tr(title!),
        fontSize: 17.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.dark,
      )
          : null,
      actions: actionsTxt != null
          ? [
        TextButton(
          onPressed: onTap,
          child: AppWidgets.textLocale(
            text: actionsTxt!,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blue,
          ),
        ),
      ]
          : null,
    );
  }
}
