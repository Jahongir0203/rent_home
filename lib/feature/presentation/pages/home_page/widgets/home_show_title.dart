import 'package:flutter/material.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_text_style.dart';

class HomeShowTitle extends StatelessWidget {
  const HomeShowTitle({
    super.key,
    required this.onTap,
    required this.title,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.w500H16,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            "See more",
            style: AppTextStyle.w500H13.copyWith(
              color: AppColors.c858585,
            ),
          ),
        ),
      ],
    );
  }
}
