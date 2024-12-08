import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';

import '../../../core/theme/app_colors.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.text,
  });

  final VoidCallback onTap;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(
        Radius.circular(6.r),
      ),
      splashColor: AppColors.black87,
      child: Container(
        width: 100.sw,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(6.r),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ).paddingSymmetric(vertical: 10.h),
      ),
    );
  }
}
